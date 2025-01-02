package core.usecase;

import core.entity.cobranca.Adquirente;

public class ImprimirViaClienteUseCase {

    public void call(Params params) {
        params.adquirente.imprimirViaCliente();
    }

    public static class Params {
        private final Adquirente adquirente;

        public Params(Adquirente adquirente) {
            this.adquirente = adquirente;
        }
    }
}
