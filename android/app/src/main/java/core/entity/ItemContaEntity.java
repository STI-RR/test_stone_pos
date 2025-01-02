package core.entity;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class ItemContaEntity {

    private Integer quantidade;
    private String descricao;
    private Double precoVenda;

    public static List<ItemContaEntity> listFromJsonArray(JSONArray jsonArray) throws JSONException {
        List<ItemContaEntity> items = new ArrayList<>(jsonArray.length());

        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            ItemContaEntity item = ItemContaEntity.fromJsonObject(jsonObject);
            items.add(item);
        }

        return items;
    }

    public static ItemContaEntity fromJsonObject(JSONObject jsonObject) throws JSONException {
        ItemContaEntity itemContaEntity = new ItemContaEntity();

        itemContaEntity.quantidade = jsonObject.getInt("quantidade");
        itemContaEntity.descricao = jsonObject.getString("descricao");
        itemContaEntity.precoVenda = jsonObject.getDouble("precoVenda");

        return itemContaEntity;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getPrecoVenda() {
        return precoVenda;
    }

    public void setPrecoVenda(Double precoVenda) {
        this.precoVenda = precoVenda;
    }
}
