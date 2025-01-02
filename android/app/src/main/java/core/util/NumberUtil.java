package core.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

/*
 * To change this template, choose Tools | Templates and open the template in
 * the editor.
 */

/**
 *
 * @author pierre
 */
public class NumberUtil {

    private static final Locale ptBr = new Locale("pt", "BR");

    public static String formataMoeda(BigDecimal valor) {
        return NumberFormat.getCurrencyInstance(ptBr).format(valor);
    }

    public static String formataMoeda(Float valor) {
        return NumberFormat.getCurrencyInstance(ptBr).format(valor);
    }

    public static String formataMoeda(Double valor) {
        return NumberFormat.getCurrencyInstance(ptBr).format(valor);
    }

    public static String formataDecimal2Casas(Double valor) {
        DecimalFormat df = new DecimalFormat("0.##");
        return df.format(valor);
    }
    
     public static String formataDecimal2Casas2(Double valor) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(valor);
    }

    public static String formataDecimal2Casas(Float valor) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(valor);
    }
    
    public static String formataDecimal2CasasComPonto(Float valor) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(valor).replace(",", ".");
    }
    
     public static String formataDecimal2CasasAliquota(Float valor) {
        DecimalFormat df = new DecimalFormat("00.00");
        return df.format(valor);
    }
    
     public static String formataDecimal3Casas(Float valor) {
        DecimalFormat df = new DecimalFormat("0.000");
        return df.format(valor);
    }
    
     public static String formataDecimal2Casas(Integer valor) {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(valor);
    }
    
    public static String formataDecimal1Casas(Float valor) {
        DecimalFormat df = new DecimalFormat("##0.0");
        return df.format(valor);
    }

    //retorna 0 - para igual, -1 - para menor e 1 - para maior
    public static Integer comparaBigDecimalZero(BigDecimal b) {
        int teste = (b.compareTo(BigDecimal.ZERO));
        return teste;

    }

    public static Double arredondaValorDuasCasasParaBaixo(Double valor) {
        BigDecimal big = new BigDecimal(valor);
        big = big.setScale(2, BigDecimal.ROUND_DOWN);
        return Double.parseDouble(big.toString());
    }

    public static Float arredondaValorDuasCasas(Float valor) {
        BigDecimal big = new BigDecimal(valor);
        big = big.setScale(2, BigDecimal.ROUND_HALF_EVEN);
        return Float.parseFloat(big.toString());
    }
    
    public static String formataSenhaDelivery(Integer senha){
        
        String aux = "";
        
        for (int i = 0; i < (2 - senha.toString().length()); i++) {
             aux += "0";
        }
        
        return aux + senha.toString();
    }


    private static String formataValor(String valor) {

        String valorFormatado = "";

        if (valor.length() == 0) {
            valorFormatado = "0,00";
        } else if (valor.length() == 1) {
            valorFormatado = "0,0" + valor;
        } else if (valor.length() == 2) {
            valorFormatado = "0," + valor;
        } else if (valor.length() >= 3) {
            int tamanho = valor.length();
            String inteiro = valor.substring(0, tamanho - 2);
            String decimal = valor.substring(tamanho - 2, tamanho);
            valorFormatado = inteiro + "," + decimal;
        }
        return valorFormatado;
    }
    

    private static String formataValor2(String valor) {

        String valorFormatado = "";

        if (valor.length() == 0) {
            valorFormatado = "00,000";
        } else if (valor.length() == 1) {
            valorFormatado = "00,00" + valor;
        } else if (valor.length() == 2) {
            valorFormatado = "00,0" + valor;
        } else if (valor.length() == 3) {
            valorFormatado = "00," + valor;
        } else if (valor.length() >= 4) {
            int tamanho = valor.length();
            String inteiro = valor.substring(0, tamanho - 3);
            String decimal = valor.substring(tamanho - 3, tamanho);
            valorFormatado = inteiro + "," + decimal;
        }
        return valorFormatado;
    }

    
}
