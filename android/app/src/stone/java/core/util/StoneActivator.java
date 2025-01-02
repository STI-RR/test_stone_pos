package core.util;

import android.content.Context;
import android.util.Log;

import com.google.firebase.Firebase;
import com.google.firebase.crashlytics.FirebaseCrashlytics;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.com.stone.posandroid.BuildConfig;
import stone.application.StoneStart;
import stone.application.interfaces.StoneCallbackInterface;
import stone.providers.ActiveApplicationProvider;
import stone.user.UserModel;
import stone.utils.Stone;
import stone.utils.keys.StoneKeyType;

public class StoneActivator {
    private static final String DEV_QRCODE_AUTHORIZATION = "f1eaabfe-127d-4069-a91c-bb4212e9da89";
    private static final String DEV_QRCODE_PROVIDER_ID = "d586ceec-7d8d-48aa-8954-5ba4f11daeb6";

    private static final String PROD_QRCODE_AUTHORIZATION = "9b4e6282-0528-4fe9-b470-0482b88f1efe";
    private static final String PROD_QRCODE_PROVIDER_ID = "9c8241f0-6661-445d-879a-f03757391969";


    public static String QRCODE_AUTHORIZATION = BuildConfig.DEBUG ? DEV_QRCODE_AUTHORIZATION : PROD_QRCODE_AUTHORIZATION;
    public static String QRCODE_PROVIDER_ID = BuildConfig.DEBUG ? DEV_QRCODE_PROVIDER_ID : PROD_QRCODE_PROVIDER_ID;
    private static boolean isInitialized = false;
    private static final String LOG_TAG = "StoneActivator";
    private static String stoneCode;

    public static List<UserModel> activate(Context context, String stoneCode) {
        StoneActivator.stoneCode = stoneCode;
        if (isInitialized) {
            Log.d(LOG_TAG, "Terminal já ativado.");
            List<UserModel> userModelList = Stone.sessionApplication.getUserModelList();

            StringBuilder toString = new StringBuilder();
            for(UserModel userMOdel : userModelList) {
                toString.append(userMOdel.toString()).append(",");
            }
            FirebaseCrashlytics crashlytics = FirebaseCrashlytics.getInstance();
            crashlytics.log("Terminal já ativado, retornando " + toString);
            return userModelList;
        }
        try {
            return initializeAndActivate(context);
        } catch (Throwable ignore) {
            return null;
        }
    }

    public static boolean isIsInitialized() {
        return isInitialized;
    }

    private static  List<UserModel> initializeAndActivate(Context context) {
        FirebaseCrashlytics crashlytics = FirebaseCrashlytics.getInstance();
        crashlytics.setCrashlyticsCollectionEnabled(true);
        try {
            Log.d(LOG_TAG, "Ativando terminal...");
            crashlytics.log("Ativando terminal...");
            Map<StoneKeyType, String> stoneKeys = new HashMap<StoneKeyType, String>() {
                {
                    put(StoneKeyType.QRCODE_AUTHORIZATION, QRCODE_AUTHORIZATION);
                    put(StoneKeyType.QRCODE_PROVIDERID, QRCODE_PROVIDER_ID);
                }
            };
            List<UserModel> init = StoneStart.init(context, stoneKeys);
            if (init == null) {
                crashlytics.log("Retorno de StoneStart.init(context, stoneKeys): null");
            } else {
                StringBuilder toString = new StringBuilder();
                for(UserModel userMOdel : init) {
                    toString.append(userMOdel.toString()).append(",");
                }
                crashlytics.log("Retorno de StoneStart.init(context, stoneKeys): " + toString);
            }
            Stone.setAppName("EasyFood App");
            if (init == null || init.get(0) == null) {
                activateStoneCodeManually(context);
            } else {
                isInitialized = true;
                Log.d(LOG_TAG, "Terminal ativado com sucesso.");
            }
            return init;
        } catch (Exception ex) {
            crashlytics.recordException(ex);
            throw ex;
        }
    }

    private static void activateStoneCodeManually(Context context) {
        Log.d(LOG_TAG, "Ativando terminal manualmente...");
        ActiveApplicationProvider activeApplicationProvider = new ActiveApplicationProvider(context);
        activeApplicationProvider.setDialogMessage("Ativando o Stone Code");
        activeApplicationProvider.setDialogTitle("Aguarde");
        activeApplicationProvider.useDefaultUI(true);
        activeApplicationProvider.setConnectionCallback(new StoneCallbackInterface() {

            @Override
            public void onSuccess() {
                Log.i(LOG_TAG, "SDK ativado com sucesso");
                isInitialized = true;
            }

            @Override
            public void onError() {
                Log.e(LOG_TAG, "Ocorreu algum erro na ativação");
            }
        });
        activeApplicationProvider.activate(stoneCode);

        isInitialized = true;
        Log.d(LOG_TAG, "Terminal ativado manualmente.");
    }
}
