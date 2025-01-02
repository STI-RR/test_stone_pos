package core.entity.relatorio;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class TipoPagamentoRelatorioEntity {

    String tipoPagamento;
    Double total;
    List<TransacaoRelatorioEntity> transacoes;

    public String getTipoPagamento() {
        return tipoPagamento;
    }

    public void setTipoPagamento(String tipoPagamento) {
        this.tipoPagamento = tipoPagamento;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public List<TransacaoRelatorioEntity> getTransacoes() {
        return transacoes;
    }

    public void setTransacoes(List<TransacaoRelatorioEntity> transacoes) {
        this.transacoes = transacoes;
    }

    public static List<TipoPagamentoRelatorioEntity> fromJsonArray(JSONArray jsonArray) {
        try {
            List<TipoPagamentoRelatorioEntity> tiposPagamentoList = new java.util.ArrayList<>();

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject tipoPagamento = jsonArray.getJSONObject(i);

                TipoPagamentoRelatorioEntity tipoPagamentoRelatorio = fromJsonString(tipoPagamento.toString());

                tiposPagamentoList.add(tipoPagamentoRelatorio);
            }

            return tiposPagamentoList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static TipoPagamentoRelatorioEntity fromJsonString(String jsonString) {
        try {
            JSONObject jsonObject = new JSONObject(jsonString);

            TipoPagamentoRelatorioEntity tipoPagamento = new TipoPagamentoRelatorioEntity();

            tipoPagamento.tipoPagamento = jsonObject.getString("tipoPagamento");
            tipoPagamento.total = jsonObject.getDouble("total");

            tipoPagamento.transacoes = TransacaoRelatorioEntity.fromJsonArray(jsonObject.getJSONArray("transacoes"));

            return tipoPagamento;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
