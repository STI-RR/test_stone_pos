package core.usecase;

import android.content.Context;
import android.view.View;

import core.entity.Impressora;
import core.entity.relatorio.RelatorioEntity;

public class ImprimirRelatorioUseCase {

    public void call(Params params) {
        final CriarViewRelatorioUseCase criarViewReciboContaUseCase = new CriarViewRelatorioUseCase(params.context, params.relatorio);
        View viewToPrint = criarViewReciboContaUseCase.call();
        params.impressora.imprimir(viewToPrint, params.callback);
    }

    public static class Params {
        private final Context context;
        private final RelatorioEntity relatorio;
        private final Impressora impressora;
        private final Impressora.Callback callback;

        public Params(Context context, RelatorioEntity relatorio, Impressora impressora, Impressora.Callback callback) {
            this.context = context;
            this.relatorio = relatorio;
            this.impressora = impressora;
            this.callback = callback;
        }
    }
}
