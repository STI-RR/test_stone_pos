package core.entity.cobranca;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

public class ConclusaoPagamentoEntity {

    private final boolean success;
    private String atk;
    private String deviceSerial;
    private String successMessage;
    private String errorMessage;
    private String authorizeMessage;
    private String cardBrand;
    private String acquirer;

    public ConclusaoPagamentoEntity(boolean success) {
        this.success = success;
    }

    public boolean isSuccess() {
        return success;
    }

    public String getAtk() {
        return atk;
    }

    public void setAtk(String atk) {
        this.atk = atk;
    }

    public String getDeviceSerial() {
        return deviceSerial;
    }

    public void setDeviceSerial(String deviceSerial) {
        this.deviceSerial = deviceSerial;
    }

    public String getSuccessMessage() {
        return successMessage;
    }

    public void setSuccessMessage(String successMessage) {
        this.successMessage = successMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public String getAuthorizeMessage() {
        return authorizeMessage;
    }

    public void setAuthorizeMessage(String authorizeMessage) {
        this.authorizeMessage = authorizeMessage;
    }

    public String getCardBrand() {
        return cardBrand;
    }

    public void setCardBrand(String cardBrand) {
        this.cardBrand = cardBrand;
    }

    public String getAcquirer() {
        return acquirer;
    }

    public void setAcquirer(String acquirer) {
        this.acquirer = acquirer;
    }

    @NotNull
    public JSONObject toJson() {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("success", success);
            jsonObject.put("atk", atk);
            jsonObject.put("deviceSerial", deviceSerial);
            jsonObject.put("successMessage", successMessage);
            jsonObject.put("errorMessage", errorMessage);
            jsonObject.put("authorizeMessage", authorizeMessage);
            jsonObject.put("cardBrand", cardBrand);
            jsonObject.put("acquirer", acquirer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
}
