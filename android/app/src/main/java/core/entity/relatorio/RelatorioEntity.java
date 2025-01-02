package core.entity.relatorio;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;
import java.util.Objects;

import core.entity.ItemContaEntity;

public class RelatorioEntity {

    String nomeEstabelecimento;
    String inicio;
    String fim;
    Double total;
    List<TipoPagamentoRelatorioEntity> tiposPagamento;

    public String getNomeEstabelecimento() {
        return nomeEstabelecimento;
    }

    public void setNomeEstabelecimento(String nomeEstabelecimento) {
        this.nomeEstabelecimento = nomeEstabelecimento;
    }

    public String getInicio() {
        return inicio;
    }

    public void setInicio(String inicio) {
        this.inicio = inicio;
    }

    public String getFim() {
        return fim;
    }

    public void setFim(String fim) {
        this.fim = fim;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public List<TipoPagamentoRelatorioEntity> getTiposPagamento() {
        return tiposPagamento;
    }

    public void setTiposPagamento(List<TipoPagamentoRelatorioEntity> tiposPagamento) {
        this.tiposPagamento = tiposPagamento;
    }

    @NotNull
    public static RelatorioEntity fromJsonString(@NotNull Object arguments) {
        Objects.requireNonNull(arguments);
        if (arguments instanceof String) {
            String jsonString = (String) arguments;

            try {
                JSONObject jsonObject = new JSONObject(jsonString);

                RelatorioEntity recibo = new RelatorioEntity();

                recibo.nomeEstabelecimento = jsonObject.getString("nomeEstabelecimento");
                recibo.inicio = jsonObject.getString("inicio");
                recibo.fim = jsonObject.getString("fim");
                recibo.total = jsonObject.getDouble("total");

                recibo.tiposPagamento = TipoPagamentoRelatorioEntity.fromJsonArray(jsonObject.getJSONArray("tiposPagamento"));

                return recibo;
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalArgumentException("Impossível transformar tipo " + arguments.getClass() + " para ReciboContaEntity. Utilize String.");
        }
    }
}
