package core.entity;

import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;
import java.util.Objects;

public class ItemFichaEntity {

    private Integer conta;
    private String descricao;
    private String observacao;
    private Integer index;
    private Integer ofIndex;
    private String funcionario;

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getConta() {
        return conta;
    }

    public void setConta(Integer conta) {
        this.conta = conta;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }


    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }


    public Integer getOfIndex() {
        return ofIndex;
    }

    public void setOfIndex(Integer ofIndex) {
        this.ofIndex = ofIndex;
    }

    public String getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(String funcionario) {
        this.funcionario = funcionario;
    }

    @NotNull
    public static ItemFichaEntity fromJsonString(@NotNull Object arguments) {
        Objects.requireNonNull(arguments);
        if (arguments instanceof String) {
            String jsonString = (String) arguments;

            try {
                JSONObject jsonObject = new JSONObject(jsonString);

                ItemFichaEntity recibo = new ItemFichaEntity();

                recibo.conta = jsonObject.getInt("conta");
                recibo.descricao = jsonObject.getString("descricao");
                recibo.observacao = jsonObject.getString("observacao");
                recibo.index = jsonObject.getInt("index");
                recibo.ofIndex = jsonObject.getInt("ofIndex");
                recibo.funcionario = jsonObject.getString("funcionario");

                return recibo;
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalArgumentException("Impossível transformar tipo " + arguments.getClass() + " para ItemFichaEntity. Utilize String.");
        }
    }
}
