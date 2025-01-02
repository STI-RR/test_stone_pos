package core.entity;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import br.com.stone.posandroid.providers.PosPrintProvider;
import providerfactory.PosPrintProviderFactory;
import stone.application.enums.ErrorsEnum;
import stone.application.interfaces.StoneCallbackInterface;

public class StonePrinter implements Impressora {
    private static final int MAX_WIDTH = 380;
    private static final String LOG_TAG = "StonePrinter";
    private final Context context;
    private static boolean printInProgress = false;
    private String scheduledImageToPrint;

    public StonePrinter(Context context) {
        this.context = context;
    }

    @Override
    public void imprimir(View view, Callback callback) {
        try {
            PosPrintProvider provider = PosPrintProviderFactory.getInstance(context);

            Log.d(LOG_TAG, "Adicionando bitmap...");
            Bitmap bitmap = creteBitmap(view);
            provider.addBitmap(bitmap);

            Log.d(LOG_TAG, "Adicionando callback ao provider...");
            provider.setConnectionCallback(new StoneCallbackInterface() {
                @Override
                public void onSuccess() {
                    Log.d(LOG_TAG, "Impressão realizada com sucesso.");
                    callback.onSuccess();
                    printInProgress = false;

                    if (scheduledImageToPrint != null) {
                        imprimirImageBase64(scheduledImageToPrint, null);
                    }
                }

                @Override
                public void onError() {
                    Log.e(LOG_TAG, "Erro ao imprimir.");
                    if (provider.getListOfErrors() != null) {
                        for (ErrorsEnum error : provider.getListOfErrors()) {
                            Log.e(LOG_TAG, error.name());
                        }
                    }
                    callback.onError("Erro ao imprimir. Falha ao conectar com a impressora.");
                    printInProgress = false;
                }
            });

            Log.d(LOG_TAG, "Imprimindo...");

            printInProgress = true;
            provider.execute();
        } catch (Exception e) {
            callback.onError("Erro desconhecido");
            Log.e(LOG_TAG, "Erro desconhecido.", e);
            printInProgress = false;
        }
    }

    @Override
    public void imprimirImageBase64(final String imageBase64, Callback callback) {
        if (!isBase64(imageBase64)) {
            Log.d(LOG_TAG, "Image null ou não é base64");
            return;
        }

        if (printInProgress) {
            scheduledImageToPrint = imageBase64;
            return;
        }
        Log.d(LOG_TAG, "Imprimindo imagem base 64");
        Log.d(LOG_TAG, imageBase64);

        PosPrintProvider posPrintProvider = PosPrintProviderFactory.getInstance(context);
        posPrintProvider.addBase64Image(imageBase64);
        posPrintProvider.execute();

        scheduledImageToPrint = null;
    }

    private Bitmap creteBitmap(View view) {

        final int WIDTH_DEFAULT = 384;
        final int POSITION_DEFAULT = 0;
        final int UNSPECIFIED_SIZE = 0;
        final int DEFAULT_PADDING = 0;

        view.setPadding(DEFAULT_PADDING, DEFAULT_PADDING, DEFAULT_PADDING, DEFAULT_PADDING);
        view.setLayoutParams(new ViewGroup.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        view.measure(View.MeasureSpec.makeMeasureSpec(WIDTH_DEFAULT, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(UNSPECIFIED_SIZE, View.MeasureSpec.UNSPECIFIED));
        view.layout(POSITION_DEFAULT, POSITION_DEFAULT, view.getMeasuredWidth(), view.getMeasuredHeight());
        Bitmap bitmap = Bitmap.createBitmap(view.getMeasuredWidth(), view.getMeasuredHeight(), Bitmap.Config.RGB_565);
        Canvas canvas = new Canvas(bitmap);
        view.draw(canvas);
        return bitmap;
    }

    /**
     * Check if value is base64 format based on regular expression
     * https://www.baeldung.com/java-check-string-base64-encoding
     *
     * @param value to verify
     * @return true if base64 or false if not
     */
    private boolean isBase64(String value) {
        if (value == null || value.isEmpty() || value.equalsIgnoreCase("null")) {
            return false;
        }
        try {
            Base64.decode(value, Base64.DEFAULT);
            return true;
        } catch (IllegalArgumentException e) {
            return false;
        }
    }
}
