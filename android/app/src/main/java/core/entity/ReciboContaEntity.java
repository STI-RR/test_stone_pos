package core.entity;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.List;
import java.util.Objects;

public class ReciboContaEntity {

    private String descricao;
    private Integer codigo;
    private String observacao;
    private Double subTotal;
    private String tituloServico;
    private Double servico;
    private Boolean cobrarCouvert;
    private Double couvert;
    private Integer quantidadeDePessoas;
    private Double total;
    private List<ItemContaEntity> itens;
    private String nomeEstabelecimento;
    private String funcionario;
    private String qrCodePixImageBase64;

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getCodigo() {
        return codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    public String getTituloServico() {
        return tituloServico;
    }

    public void setTituloServico(String tituloServico) {
        this.tituloServico = tituloServico;
    }

    public Double getServico() {
        return servico;
    }

    public void setServico(Double servico) {
        this.servico = servico;
    }

    public Boolean getCobrarCouvert() {
        return cobrarCouvert;
    }

    public void setCobrarCouvert(Boolean cobrarCouvert) {
        this.cobrarCouvert = cobrarCouvert;
    }

    public Double getCouvert() {
        return couvert;
    }

    public void setCouvert(Double couvert) {
        this.couvert = couvert;
    }

    public Integer getQuantidadeDePessoas() {
        return quantidadeDePessoas;
    }

    public void setQuantidadeDePessoas(Integer quantidadeDePessoas) {
        this.quantidadeDePessoas = quantidadeDePessoas;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public List<ItemContaEntity> getItens() {
        return itens;
    }

    public void setItens(List<ItemContaEntity> itens) {
        this.itens = itens;
    }

    public String getNomeEstabelecimento() {
        return nomeEstabelecimento;
    }

    public void setNomeEstabelecimento(String nomeEstabelecimento) {
        this.nomeEstabelecimento = nomeEstabelecimento;
    }

    public String getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(String funcionario) {
        this.funcionario = funcionario;
    }

    public String getQrCodePixImageBase64() {
        return qrCodePixImageBase64;
    }

    public void setQrCodePixImageBase64(String qrCodePixImageBase64) {
        this.qrCodePixImageBase64 = qrCodePixImageBase64;
    }

    @NotNull
    public static ReciboContaEntity fromJsonString(@NotNull Object arguments) {
        Objects.requireNonNull(arguments);
        if (arguments instanceof String) {
            String jsonString = (String) arguments;

            try {
                JSONObject jsonObject = new JSONObject(jsonString);

                ReciboContaEntity recibo = new ReciboContaEntity();

                recibo.descricao = jsonObject.getString("descricao");
                recibo.codigo = jsonObject.getInt("codigo");
                recibo.observacao = jsonObject.getString("observacao");
                recibo.subTotal = jsonObject.getDouble("subTotal");
                recibo.tituloServico = jsonObject.getString("tituloServico");
                recibo.servico = jsonObject.getDouble("servico");
                recibo.cobrarCouvert = jsonObject.getBoolean("cobrarCouvert");
                recibo.couvert = jsonObject.getDouble("couvert");
                recibo.quantidadeDePessoas = jsonObject.getInt("quantidadeDePessoas");
                recibo.total = jsonObject.getDouble("total");
                recibo.itens = ItemContaEntity.listFromJsonArray(jsonObject.getJSONArray("itens"));
                recibo.nomeEstabelecimento = jsonObject.getString("nomeEstabelecimento");
                recibo.funcionario = jsonObject.getString("funcionario");
                recibo.qrCodePixImageBase64 = jsonObject.optString("qrCodePixImageBase64");

                return recibo;
            } catch (JSONException e) {
                throw new RuntimeException(e);
            }
        } else {
            throw new IllegalArgumentException("Impossível transformar tipo " + arguments.getClass() + " para ReciboContaEntity. Utilize String.");
        }
    }
}
