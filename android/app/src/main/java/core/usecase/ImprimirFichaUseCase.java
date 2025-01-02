package core.usecase;

import android.content.Context;
import android.view.View;

import core.entity.Impressora;
import core.entity.ItemFichaEntity;
import core.entity.ReciboContaEntity;

public class ImprimirFichaUseCase {

    public void call(Params params) {
        final CriarViewFichaUseCase criarViewFichaUseCase = new CriarViewFichaUseCase(params.context, params.itemFicha);
        View viewToPrint = criarViewFichaUseCase.call();
        params.impressora.imprimir(viewToPrint, params.callback);
    }

    public static class Params {
        private final Context context;
        private final ItemFichaEntity itemFicha;
        private final Impressora impressora;
        private final Impressora.Callback callback;

        public Params(Context context, ItemFichaEntity itemFicha, Impressora impressora, Impressora.Callback callback) {
            this.context = context;
            this.itemFicha = itemFicha;
            this.impressora = impressora;
            this.callback = callback;
        }
    }
}
