package core.entity.relatorio;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class TransacaoRelatorioEntity {

    Integer conta;
    Double valor;
    String dataHora;

    public Integer getConta() {
        return conta;
    }

    public void setConta(Integer conta) {
        this.conta = conta;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getDataHora() {
        return dataHora;
    }

    public void setDataHora(String dataHora) {
        this.dataHora = dataHora;
    }

    public static List<TransacaoRelatorioEntity> fromJsonArray(JSONArray jsonArray) {
        try {
            List<TransacaoRelatorioEntity> transacoesList = new java.util.ArrayList<>();

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject transacao = jsonArray.getJSONObject(i);

                TransacaoRelatorioEntity transacaoRelatorio = fromJsonString(transacao.toString());

                transacoesList.add(transacaoRelatorio);
            }

            return transacoesList;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static TransacaoRelatorioEntity fromJsonString(String jsonString) {
        try {
            JSONObject jsonObject = new JSONObject(jsonString);

            TransacaoRelatorioEntity transacao = new TransacaoRelatorioEntity();

            transacao.conta = jsonObject.getInt("conta");
            transacao.valor = jsonObject.getDouble("valor");
            transacao.dataHora = jsonObject.getString("dataHora");

            return transacao;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
