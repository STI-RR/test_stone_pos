package core.entity.cobranca;

import androidx.annotation.NonNull;

import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

public class AtualizacaoPagamentoEntity {
    private final int codigoEvento;
    private final String descricaoEvento;

    public AtualizacaoPagamentoEntity(int codigoEvento, String descricaoEvento) {
        this.codigoEvento = codigoEvento;
        this.descricaoEvento = descricaoEvento;
    }

    public int getCodigoEvento() {
        return codigoEvento;
    }

    public String getDescricaoEvento() {
        return descricaoEvento;
    }

    @Override
    public String toString() {
        return "AtualizacaoPagamentoEntity{" +
                "codigoEvento=" + codigoEvento +
                ", descricaoEvento='" + descricaoEvento + '\'' +
                '}';
    }

    @NotNull
    public JSONObject toJson() {
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("codigoEvento", codigoEvento);
            jsonObject.put("descricaoEvento", descricaoEvento);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return jsonObject;
    }
}
