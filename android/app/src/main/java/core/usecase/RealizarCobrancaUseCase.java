package core.usecase;

import android.content.Context;

import core.entity.cobranca.Adquirente;
import core.entity.cobranca.ConclusaoPagamentoEntity;
import core.entity.cobranca.RequisicaoPagamentoEntity;

public class RealizarCobrancaUseCase {

    public ConclusaoPagamentoEntity call(Params params) {
        final ConclusaoPagamentoEntity result = params.adquirente.cobrar(params.requisicaoPagamento, params.callback);
        return result;
    }

    public static class Params {

        private final Context context;
        private final RequisicaoPagamentoEntity requisicaoPagamento;
        private final Adquirente adquirente;
        private final Adquirente.Callback callback;

        public Params(Context context, RequisicaoPagamentoEntity requisicaoPagamento, Adquirente Adquirente, Adquirente.Callback callback) {
            this.context = context;
            this.requisicaoPagamento = requisicaoPagamento;
            this.adquirente = Adquirente;
            this.callback = callback;
        }
    }
}
