package core.entity;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.firebase.crashlytics.FirebaseCrashlytics;

import org.jetbrains.annotations.NotNull;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.stirr.easyfood.app.easyfood_app.BuildConfig;
import br.com.stone.posandroid.providers.PosPrintReceiptProvider;
import br.com.stone.posandroid.providers.PosReprintReceiptProvider;
import br.com.stone.posandroid.providers.PosTransactionProvider;
import core.entity.cobranca.Adquirente;
import core.entity.cobranca.AtualizacaoPagamentoEntity;
import core.entity.cobranca.ConclusaoPagamentoEntity;
import core.entity.cobranca.RequisicaoPagamentoEntity;
import core.util.StoneActivator;
import stone.application.StoneStart;
import stone.application.enums.Action;
import stone.application.enums.ErrorsEnum;
import stone.application.enums.InstalmentTransactionEnum;
import stone.application.enums.ReceiptType;
import stone.application.enums.TypeOfTransactionEnum;
import stone.application.interfaces.StoneActionCallback;
import stone.application.interfaces.StoneCallbackInterface;
import stone.database.transaction.TransactionObject;
import stone.providers.ActiveApplicationProvider;
import stone.user.UserModel;
import stone.utils.Stone;
import stone.utils.keys.StoneKeyType;

public class StoneAdquirente implements Adquirente {
    private final Context context;
    private static final String LOG_TAG = "StoneAdquirente";
    private static TransactionObject lastTransaction;
    private static PosTransactionProvider runningTransaction;


    public StoneAdquirente(Context context) {
        this.context = context;
    }

    @Override
    public void inicializarSdk(Context context, String... args) {
        final String stoneCode;
        if (args != null && args.length > 0) {
            stoneCode = args[0];
        } else {
            stoneCode = null;
        }
        StoneActivator.activate(context, stoneCode);
    }

    @Override
    public ConclusaoPagamentoEntity cobrar(RequisicaoPagamentoEntity request, Callback callback) {
        inicializarSdk(this.context);
        TransactionObject transaction = createTransactionObject(request);

        final PosTransactionProvider provider = getPosTransactionProvider(transaction);
        runningTransaction = provider;

        provider.setConnectionCallback(new StoneActionCallback() {
            @Override
            public void onStatusChanged(Action action) {
                final int code = action.ordinal();
                if (action == Action.TRANSACTION_WAITING_QRCODE_SCAN) {
                    String base64 = bitmapToBase64(transaction.getQRCode());
                    AtualizacaoPagamentoEntity progress = new AtualizacaoPagamentoEntity(code, base64);
                    callback.onProgress(progress);
                } else {
                    final String message = getMessageFromPlugPagCode(action);
                    AtualizacaoPagamentoEntity progress = new AtualizacaoPagamentoEntity(code, message);
                    callback.onProgress(progress);
                }
            }

            @Override
            public void onSuccess() {
                /**
                 * |----------------------------------------------------------------------------------------------------------------------------|
                 * |                                                  Status da Transação                                                       |
                 * |----------------------------------------------------------------------------------------------------------------------------|
                 * |   Valor        |   Descrição                                                                                               |
                 * |     UNKNOWN    |	Ocorreu um erro antes de ser enviada para o autorizador.                                                |
                 * |    APPROVED    |	Transação aprovada com sucesso.                                                                         |
                 * |    DECLINED    |	Transação negada.                                                                                       |
                 * |DECLINED_BY_CARD|	Transação negada pelo cartão.                                                                           |
                 * |  CANCELLED     |	Transação cancelada (ocorre no cancelamento, ou seja, CancellationProvider).                            |
                 * |PARTIAL_APPROVED|	Transação foi parcialmente aprovada.                                                                    |
                 * | TECHNICAL_ERROR|	Erro técnico (ocorreu um erro ao processar a mensagem no autorizador).                                  |
                 * |    REJECTED    |	Transação rejeitada.                                                                                    |
                 * |   WITH_ERROR   |	Transação não completada com sucesso. O Provedor de Reversão irá desfazer as transações com este status.|
                 * |     PENDING    |	O provider de transação está em andamento.                                                              |
                 * |    REVERSED    |	A transação foi cancelada automaticamente devido à algum erro ou interrupção no fluxo de pagamento.     |
                 * |PENDING_REVERSAL|	Transação foi interrompida por algum motivo e será revertida pelo provider de reversão.                 |
                 * |----------------------------------------------------------------------------------------------------------------------------|
                 */

                runningTransaction = null;

                Log.i(LOG_TAG, "onSuccess " + provider.getTransactionStatus());
                Log.i(LOG_TAG, "ATK: " + transaction.getAcquirerTransactionKey());

                ConclusaoPagamentoEntity resultEntity = null;
                switch (provider.getTransactionStatus()) {
                    case APPROVED:
                        lastTransaction = transaction;

                        resultEntity = new ConclusaoPagamentoEntity(true);
                        resultEntity.setAtk(transaction.getAcquirerTransactionKey());
                        resultEntity.setCardBrand(transaction.getCardBrandName());
                        resultEntity.setAcquirer("STONE");
                        resultEntity.setDeviceSerial(Stone.getPosAndroidDevice().getPosAndroidSerialNumber());
                        resultEntity.setSuccessMessage(provider.getTransactionStatus().name());
                        resultEntity.setAuthorizeMessage(provider.getMessageFromAuthorize());

                        if (request.isImprimirViaEstabelecimento()) {
                            printMerchantReceipt(transaction);
                        }
                        break;
                    default:
                        resultEntity = new ConclusaoPagamentoEntity(false);
                        resultEntity.setAtk(transaction.getAcquirerTransactionKey());
                        resultEntity.setCardBrand(transaction.getCardBrandName());
                        resultEntity.setAcquirer("STONE");
                        resultEntity.setDeviceSerial(Stone.getPosAndroidDevice().getPosAndroidSerialNumber());
                        resultEntity.setSuccessMessage(provider.getTransactionStatus().name());
                        resultEntity.setAuthorizeMessage(provider.getMessageFromAuthorize());
                        break;
                }

                callback.onFinish(resultEntity);
            }

            @Override
            public void onError() {
                runningTransaction = null;

                Log.i(LOG_TAG, "onError " + provider.getTransactionStatus());
                Log.i(LOG_TAG, "ATK: " + transaction.getAcquirerTransactionKey());

                ConclusaoPagamentoEntity resultEntity = new ConclusaoPagamentoEntity(false);
                resultEntity.setAtk(transaction.getAcquirerTransactionKey());
                resultEntity.setAcquirer("STONE");
                resultEntity.setDeviceSerial(Stone.getPosAndroidDevice().getPosAndroidSerialNumber());
                resultEntity.setErrorMessage(getErrorMessage(provider));
                resultEntity.setAuthorizeMessage(provider.getMessageFromAuthorize());

                callback.onFinish(resultEntity);
            }
        });

        try {
            provider.execute();
        }catch (Throwable ex) {
            FirebaseCrashlytics.getInstance().recordException(ex);
        }

        return null;
    }

    @NonNull
    private static String getErrorMessage(PosTransactionProvider provider) {
        List<ErrorsEnum> listOfErrors = provider.getListOfErrors();
        if (listOfErrors.isEmpty()) {
            return provider.getTransactionStatus().name();
        }

        StringBuilder errorMessage = new StringBuilder();
        for (ErrorsEnum error : listOfErrors) {
            errorMessage.append(error.name()).append(" | ");
        }
        return errorMessage.toString().substring(0, errorMessage.length() - 3);
    }

    private PosTransactionProvider getPosTransactionProvider(TransactionObject transaction) {
        UserModel userModel = Stone.getUserModel(0);

        if (userModel == null) {
            Map<StoneKeyType, String> stoneKeys = getStoneKeyTypeStringMap();
            List<UserModel> userModelList = StoneStart.init(context, stoneKeys);
            if (userModelList != null && !userModelList.isEmpty()) {
                userModel = userModelList.get(0);
            }
        }

        return new PosTransactionProvider(context, transaction, userModel);
    }

    @NonNull
    private static Map<StoneKeyType, String> getStoneKeyTypeStringMap() {
        final String DEV_QRCODE_AUTHORIZATION = "f1eaabfe-127d-4069-a91c-bb4212e9da89";
        final String DEV_QRCODE_PROVIDER_ID = "d586ceec-7d8d-48aa-8954-5ba4f11daeb6";

        final String PROD_QRCODE_AUTHORIZATION = "9b4e6282-0528-4fe9-b470-0482b88f1efe";
        final String PROD_QRCODE_PROVIDER_ID = "9c8241f0-6661-445d-879a-f03757391969";

        String QRCODE_AUTHORIZATION = BuildConfig.DEBUG ? DEV_QRCODE_AUTHORIZATION : PROD_QRCODE_AUTHORIZATION;
        String QRCODE_PROVIDER_ID = BuildConfig.DEBUG ? DEV_QRCODE_PROVIDER_ID : PROD_QRCODE_PROVIDER_ID;

        // stoneKeys necessario somente para utilização de transações com QRCode, como PIX
        Map<StoneKeyType, String> stoneKeys = new HashMap<StoneKeyType, String>() {
            {
                put(StoneKeyType.QRCODE_AUTHORIZATION, QRCODE_AUTHORIZATION);
                put(StoneKeyType.QRCODE_PROVIDERID, QRCODE_PROVIDER_ID);
            }
        };
        return stoneKeys;
    }

    private String bitmapToBase64(Bitmap qrCode) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        qrCode.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream);
        byte[] byteArray = byteArrayOutputStream.toByteArray();
        return Base64.encodeToString(byteArray, Base64.DEFAULT);
    }

    private TransactionObject createTransactionObject(RequisicaoPagamentoEntity request) {
        TransactionObject transaction = new TransactionObject();

        transaction.setAmount(String.valueOf(request.getValorEmCentavos()));
        transaction.setInstalmentTransaction(InstalmentTransactionEnum.ONE_INSTALMENT);
        transaction.setTypeOfTransaction(getType(request.getFormaDePagamento()));
        transaction.setCapture(true);

        return transaction;
    }

    private String getMessageFromPlugPagCode(Action action) {
        switch (action) {
            case TRANSACTION_WAITING_CARD:
                return "INSIRA OU APROXIME O CARTÃO";
            case TRANSACTION_WAITING_SWIPE_CARD:
                return "PASSE O CARTÃO";
            case TRANSACTION_WAITING_PASSWORD:
                return "INSIRA A SENHA";
            case TRANSACTION_SENDING:
                return "ENVIANDO...";
            case TRANSACTION_REMOVE_CARD:
                return "RETIRE O CARTÃO";
            case REVERSING_TRANSACTION_WITH_ERROR:
                return "ERRO NA TRANSAÇÃO";
            case TRANSACTION_TYPE_SELECTION:
                return "TIPO SELECIONADO";
            case TRANSACTION_REQUIRES_CARDHOLDER_TO_CHECK_DEVICE:
                return "TRANSACTION_REQUIRES_CARDHOLDER_TO_CHECK_DEVICE";
            case SWITCH_INTERFACE:
                return "SWITCH_INTERFACE";
            default:
                return "";
        }
    }

    private TypeOfTransactionEnum getType(String formaDePagamento) {
        switch (formaDePagamento.toLowerCase()) {
            case "debito":
                return TypeOfTransactionEnum.DEBIT;
            case "credito":
                return TypeOfTransactionEnum.CREDIT;
            case "pix":
                return TypeOfTransactionEnum.PIX;
            default:
                throw new IllegalArgumentException("Forma de pagamento " + formaDePagamento + " não suportada");
        }
    }

    private void printMerchantReceipt(TransactionObject transaction) {
        try {
            PosPrintReceiptProvider posPrintReceiptProvider = new PosPrintReceiptProvider(context, transaction, ReceiptType.MERCHANT);
            posPrintReceiptProvider.execute();
        } catch (Exception e) {
            Log.e(LOG_TAG, "Erro ao imprimir comprovante do estabelecimento", e);
        }
    }

    @Override
    public boolean imprimirViaCliente() {
        if (lastTransaction != null) {
            try {
                PosPrintReceiptProvider posPrintReceiptProvider = new PosPrintReceiptProvider(context, lastTransaction, ReceiptType.CLIENT);
                posPrintReceiptProvider.execute();
                return true;
            } catch (Exception e) {
                Log.e(LOG_TAG, "Erro ao imprimir comprovante do cliente", e);
            }
        }
        return false;
    }

    @Override
    public void cancelarPagamento() {
        if (runningTransaction != null) {
            runningTransaction.abortPayment();
            runningTransaction = null;
        }
    }

    @Override
    public void reimprimirViaCliente(String atk) {
        ReceiptType type = ReceiptType.CLIENT;
        reprint(atk, type);
    }

    @Override
    public void reimprimirViaEstabelecimento(String atk) {
        ReceiptType type = ReceiptType.MERCHANT;
        reprint(atk, type);
    }

    private void reprint(String atk, ReceiptType type) {
        try {
        PosReprintReceiptProvider provider = new PosReprintReceiptProvider(context, atk, type);
        provider.setConnectionCallback(new StoneCallbackInterface() {
            @Override
            public void onSuccess() {
                Log.i(LOG_TAG, "Comprovante reimpresso com sucesso");
            }

            @Override
            public void onError() {
                Log.e(LOG_TAG, "Erro ao reimprimir comprovante");
                List<ErrorsEnum> listOfErrors = provider.getListOfErrors();
                for (ErrorsEnum error : listOfErrors) {
                    Log.e(LOG_TAG, error.name());
                }
            }
        });
        provider.execute();
        } catch (Exception e) {
            Log.e(LOG_TAG, "Erro ao reimprimir comprovante", e);
        }
    }
}
