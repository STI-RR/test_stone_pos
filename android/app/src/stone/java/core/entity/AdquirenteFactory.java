package core.entity;

import android.content.Context;

import core.entity.cobranca.Adquirente;

public class AdquirenteFactory {

    public static Adquirente getInstance(Context context) {
        return new StoneAdquirente(context);
    }
}
