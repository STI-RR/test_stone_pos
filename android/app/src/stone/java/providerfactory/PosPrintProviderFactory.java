package providerfactory;

import android.content.Context;
import android.util.Log;

import java.util.HashMap;
import java.util.Map;

import br.com.stone.posandroid.BuildConfig;
import br.com.stone.posandroid.providers.PosPrintProvider;
import core.util.StoneActivator;
import stone.application.StoneStart;
import stone.utils.keys.StoneKeyType;

public class PosPrintProviderFactory {

    private static PosPrintProvider provider;
    private static final String LOG_TAG = "PosPrintProviderFactory";

    public static PosPrintProvider getInstance(Context context) {
        Log.d(LOG_TAG, "Verificando se o SDK Stone está inicializado...");
        if (!StoneActivator.isIsInitialized()) {
            Log.d(LOG_TAG, "PosPrintProvider não autenticado.");
            StoneActivator.activate(context, null);
        }

        Log.d(LOG_TAG, "Criando a referência do PosPrintProvider...");
        provider = new PosPrintProvider(context);
        Log.d(LOG_TAG, "Referência do PosPrintProvider criada com sucesso!!");

        Log.d(LOG_TAG, "Retornando instância de PosPrintProvider.");
        return provider;
    }
}
