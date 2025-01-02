package core.entity.cobranca;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Objects;

import core.entity.ItemContaEntity;
import core.entity.ReciboContaEntity;

public class RequisicaoPagamentoEntity {

    private RequisicaoPagamentoEntity() {}

    private String sku;
    private String formaDePagamento; // 'credito' 'debito' ou 'pix'
    private int valorEmCentavos;
    private boolean imprimirViaEstabelecimento;

    @Nullable
    public String getSku() {
        return sku;
    }

    @NotNull
    public String getFormaDePagamento() {
        return formaDePagamento;
    }

    public int getValorEmCentavos() {
        return valorEmCentavos;
    }

    public boolean isImprimirViaEstabelecimento() {
        return imprimirViaEstabelecimento;
    }

    @NotNull
    public static RequisicaoPagamentoEntity fromJsonString(@NotNull Object arguments) {
        Objects.requireNonNull(arguments);
        if (arguments instanceof String) {
            String jsonString = (String) arguments;

            try {
                JSONObject jsonObject = new JSONObject(jsonString);

                RequisicaoPagamentoEntity request = new RequisicaoPagamentoEntity();

                request.formaDePagamento = jsonObject.getString("formaDePagamento");
                request.sku = jsonObject.optString("sku");
                request.valorEmCentavos = jsonObject.getInt("valorEmCentavos");
                request.imprimirViaEstabelecimento = jsonObject.optBoolean("imprimirViaEstabelecimento", true);

                return request;
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalArgumentException("Impossível transformar tipo " + arguments.getClass() + " para RequisicaoPagamentoEntity. Utilize String.");
        }
    }
}
