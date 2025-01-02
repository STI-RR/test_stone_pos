package core.entity.cobranca;

import android.content.Context;

public interface Adquirente {

    void inicializarSdk(Context context, String... args);

    ConclusaoPagamentoEntity cobrar(RequisicaoPagamentoEntity request, Callback callback);

    boolean imprimirViaCliente();

    void cancelarPagamento();

    void reimprimirViaCliente(String atk);

    void reimprimirViaEstabelecimento(String atk);

    interface Callback {
        void onProgress(AtualizacaoPagamentoEntity progress);
        void onFinish(ConclusaoPagamentoEntity result);
    }
}
