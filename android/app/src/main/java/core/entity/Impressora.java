package core.entity;

import android.telecom.Call;
import android.view.View;

public interface Impressora {

    void imprimir(View view, Callback callback);
    void imprimirImageBase64(String imageBase64, Callback callback);

    interface Callback {
        void onSuccess();
        void onError(String message);
    }
}
