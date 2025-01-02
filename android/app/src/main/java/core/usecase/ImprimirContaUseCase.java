package core.usecase;

import android.content.Context;
import android.view.View;

import core.entity.Impressora;
import core.entity.ReciboContaEntity;

public class ImprimirContaUseCase {

    public void call(Params params) {
        final CriarViewReciboContaUseCase criarViewReciboContaUseCase = new CriarViewReciboContaUseCase(params.context, params.reciboConta);
        View viewToPrint = criarViewReciboContaUseCase.call();
        params.impressora.imprimir(viewToPrint, params.callback);

        String qrCodePixImageBase64 = params.reciboConta.getQrCodePixImageBase64();
        if (qrCodePixImageBase64 != null) {
            params.impressora.imprimirImageBase64(qrCodePixImageBase64, null);
        }
    }

    public static class Params {
        private final Context context;
        private final ReciboContaEntity reciboConta;
        private final Impressora impressora;
        private final Impressora.Callback callback;

        public Params(Context context, ReciboContaEntity reciboConta, Impressora impressora, Impressora.Callback callback) {
            this.context = context;
            this.reciboConta = reciboConta;
            this.impressora = impressora;
            this.callback = callback;
        }
    }
}
