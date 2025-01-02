package core.util;

import android.content.Context;


import java.util.List;

import stone.user.UserModel;

public class FlavorInfo {

    public String getInfo(Context context) {
        List<UserModel> userModelList = StoneActivator.activate(context, null);
        StringBuilder stringBuilder = new StringBuilder();

        for (UserModel userModel : userModelList) {
            stringBuilder.append(userModel.getMerchantName());
            stringBuilder.append(" - ");
            stringBuilder.append(userModel.getStoneCode());
            stringBuilder.append("\n");
        }

        return stringBuilder.toString();
    }
}
