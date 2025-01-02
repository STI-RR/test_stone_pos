package core.entity;

import android.content.Context;

public class ImpressoraFactory {

    public static Impressora getInstance(Context context) {
        return new StonePrinter(context);
    }
}
