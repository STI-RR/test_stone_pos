package core.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PafUtil {

    private String delimitador;
    private SimpleDateFormat formatoData;
    private DecimalFormat formatoDecimal;
    private String crlf;

    public PafUtil() {
        delimitador = "";
        formatoData = new SimpleDateFormat("yyyyMMdd");
        formatoDecimal = new DecimalFormat("0.00");
        crlf = System.getProperty("line.separator");
    }

    public String fill(String valor) {
        return valor == null ? "" : valor.trim();
    }

    public String fill(Date valor) {
        return valor == null ? "00000000" : formatoData.format(valor);
    }

    public String lFill(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete(" ", quantidade) : Biblioteca.repete(" ", quantidade - valor.trim().length()) + valor.trim();
    }

    public String lFillHtml(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("&nbsp;", quantidade) : Biblioteca.repete("&nbsp;", quantidade - valor.trim().length()) + valor.trim();
    }

    public String rFillHtml(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("&nbsp;", quantidade) : valor.trim() + Biblioteca.repete("&nbsp;", quantidade - valor.trim().length());
    }

    public String lFillDocs(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - valor.trim().length()) + valor.trim();
    }

    public String lFillGTI(String valor, Integer quantidade, String aux) {
        return valor == null ? Biblioteca.repete(aux, quantidade) : Biblioteca.repete(aux, quantidade - valor.trim().length()) + valor.trim();
    }

    public String rFill(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete(" ", quantidade) : valor.trim() + Biblioteca.repete(" ", quantidade - valor.trim().length());
    }

    public String rFillViolado(String valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("?", quantidade) : valor.trim() + Biblioteca.repete("?", quantidade - valor.trim().length());
    }

    public String lFill(Integer valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - valor.toString().length()) + valor;
    }

    public String rFill(Integer valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : valor + Biblioteca.repete("0", quantidade - valor.toString().length());
    }

    public String lFill(Double valor, Integer quantidade, String filler) {
        if (filler == null) {
            filler = "0";
        }
        return valor == null
                ? Biblioteca.repete(filler, quantidade)
                : Biblioteca.repete(filler, quantidade - formatoDecimal.format(valor).length()) + formatoDecimal.format(valor);
    }

    public String rFill(Double valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : formatoDecimal.format(valor) + Biblioteca.repete("0", quantidade - formatoDecimal.format(valor).length());
    }

    public String lFill(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - formatoDecimal.format(valor).length()) + formatoDecimal.format(valor);
    }

    public String lFill2Casas(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - formataDecimal2CasasSemVirgula(valor).length()) + formataDecimal2CasasSemVirgula(valor);
    }

    public String lFill3Casas(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - formataDecimal3CasasSemVirgula(valor).length()) + formataDecimal3CasasSemVirgula(valor);
    }

    public String rFill(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : formatoDecimal.format(valor) + Biblioteca.repete("0", quantidade - formatoDecimal.format(valor).length());
    }

    public String rFill2Casas(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : formataDecimal2CasasSemVirgula(valor) + Biblioteca.repete("0", quantidade - formataDecimal2CasasSemVirgula(valor).length());
    }

    public String rFill3Casas(Float valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : formataDecimal3CasasSemVirgula(valor) + Biblioteca.repete("0", quantidade - formataDecimal3CasasSemVirgula(valor).length());
    }

    public String fill(BigDecimal valor) {
        return valor == null ? delimitador : delimitador + formatoDecimal.format(valor);
    }

    public String preencherComzerosAEsquerda(Integer valor, Integer quantidade) {
        return valor == null ? Biblioteca.repete("0", quantidade) : Biblioteca.repete("0", quantidade - valor.toString().length()) + valor;
    }

    /**
     * @return the delimitador
     */
    public String getDelimitador() {
        return delimitador;
    }

    /**
     * @param delimitador the delimitador to set
     */
    public void setDelimitador(String delimitador) {
        this.delimitador = delimitador;
    }

    /**
     * @return the formatoData
     */
    public SimpleDateFormat getFormatoData() {
        return formatoData;
    }

    /**
     * @param formatoData the formatoData to set
     */
    public void setFormatoData(SimpleDateFormat formatoData) {
        this.formatoData = formatoData;
    }

    /**
     * @return the crlf
     */
    public String getCrlf() {
        return crlf;
    }

    /**
     * @param crlf the crlf to set
     */
    public void setCrlf(String crlf) {
        this.crlf = crlf;
    }

    /**
     * @return the formatoDecimal
     */
    public DecimalFormat getFormatoDecimal() {
        return formatoDecimal;
    }

    /**
     * @param formatoDecimal the formatoDecimal to set
     */
    public void setFormatoDecimal(DecimalFormat formatoDecimal) {
        this.formatoDecimal = formatoDecimal;
    }

    public String formataDecimal2CasasSemVirgula(Float valor) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(valor).replace(",", "");
    }

    public String formataDecimal3CasasSemVirgula(Float valor) {
        DecimalFormat df = new DecimalFormat("0.000");
        return df.format(valor).replace(",", "");
    }

}
