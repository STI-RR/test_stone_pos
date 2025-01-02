package core.usecase;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import core.entity.ItemContaEntity;
import core.entity.ReciboContaEntity;

public class CriarViewReciboContaUseCase {

    private final ReciboContaEntity reciboConta;
    private final Context context;
    private final int MAX_WIDTH = 380;
    private final Locale ptBr = new Locale("pt", "BR");

    public CriarViewReciboContaUseCase(Context context, ReciboContaEntity reciboConta) {
        this.context = context;
        this.reciboConta = reciboConta;
    }

    public View call() {

        SimpleDateFormat dataFormat = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss", ptBr);
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(ptBr);

        final String linhaDivisoria = "------------------------------------------------------";
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(LinearLayout.VERTICAL);
        linearLayout.setLayoutParams(getLayoutParams());

        linearLayout.addView(getTextViewBoldCentralizedExtra(reciboConta.getDescricao()));
        linearLayout.addView(getTextViewCentralized(reciboConta.getNomeEstabelecimento()));
        linearLayout.addView(getTextView("CONTA: " + reciboConta.getCodigo()));
        linearLayout.addView(getTextView("IMPRESSÃO: " + dataFormat.format(new Date())));
        linearLayout.addView(getTextView("FUNC.: " + reciboConta.getFuncionario()));
        if (!reciboConta.getObservacao().isEmpty()) {
            linearLayout.addView(getTextView("MESA: " + reciboConta.getObservacao()));
        }

        linearLayout.addView(getTextView(linhaDivisoria));
        linearLayout.addView(getTextView("QDTE   DESC                   VALOR(R$)"));

        Double valorItens = 0.0;
        for (ItemContaEntity item : reciboConta.getItens()) {
            linearLayout.addView(getTextView(item.getQuantidade() + "   " + item.getDescricao()));
            linearLayout.addView(getTextViewEndAlignment(numberFormat.format(item.getPrecoVenda())));

            valorItens += item.getPrecoVenda();
        }

        linearLayout.addView(getTextView(linhaDivisoria));

        linearLayout.addView(getTextViewEndAlignment("SUBTOTAL(R$): " + numberFormat.format(valorItens)));
        if (reciboConta.getServico() > 0) {
            final String tituloServico = reciboConta.getTituloServico() + " (R$): ";
            linearLayout.addView(getTextViewEndAlignment(tituloServico + numberFormat.format(reciboConta.getServico())));
        }
        if (reciboConta.getCobrarCouvert() == Boolean.TRUE) {
            linearLayout.addView(getTextViewEndAlignment("COUVERT(R$): " + numberFormat.format(reciboConta.getCouvert())));
        }
        final Double valorTotal = valorItens + reciboConta.getServico() + reciboConta.getCouvert();
        if (reciboConta.getQuantidadeDePessoas() > 1) {
            final Double valorPorPessoa = valorTotal / reciboConta.getQuantidadeDePessoas();

            linearLayout.addView(getTextView(""));
            linearLayout.addView(getTextViewEndAlignment("NUMERO DE PESSOAS: " + reciboConta.getQuantidadeDePessoas()));
            linearLayout.addView(getTextViewEndAlignment("TOTAL POR PESSOA: " + numberFormat.format(valorPorPessoa)));
        }
        linearLayout.addView(getTextViewBoldEndAlignmentMedium("TOTAL: " + numberFormat.format(valorTotal)));
        linearLayout.addView(getTextView(""));
        linearLayout.addView(getTextView(rodape()));
        linearLayout.addView(getTextView(""));
        linearLayout.addView(getTextViewCentralizedSmall("Desenvolvido em Roraima por STIRR"));
        linearLayout.addView(getTextViewCentralizedSmall("www.stirr.com.br / (95)98111-2691"));

        return linearLayout;
    }

    private String rodape() {
        PackageInfo pInfo = null;
        String version = "EasyFood POS";
        try {
            pInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            version += " " + pInfo.versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        StringBuilder sb = new StringBuilder();
        int max = 30;
        int lines = (max - version.length()) / 2;

        for (int i = 0; i < lines; i++) {
            sb.append("=");
        }
        sb.append(version);
        for (int i = 0; i < lines; i++) {
            sb.append("=");
        }
        return sb.toString();
    }

    private TextView getTextViewCentralized(String content) {
        TextView textView = getTextView(content);
        textView.setGravity(Gravity.CENTER); // Aligns the text to the center
        return textView;
    }

    private TextView getTextViewCentralizedSmall(String content) {
        TextView textView = getTextViewCentralized(content);
        textView.setGravity(Gravity.CENTER); // Aligns the text to the center
        textView.setTextSize(10);
        return textView;
    }

    private TextView getTextViewBoldCentralized(String content) {
        TextView textView = getTextViewBold(content);
        textView.setGravity(Gravity.CENTER); // Aligns the text to the center
        return textView;
    }

    private TextView getTextViewBoldCentralizedExtra(String content) {
        TextView textView = getTextViewBoldCentralized(content);
        textView.setGravity(Gravity.CENTER); // Aligns the text to the center
        textView.setTextSize(24);
        return textView;
    }

    private TextView getTextViewEndAlignment(String content) {
        TextView textView = getTextView(content);
        textView.setGravity(Gravity.END); // Aligns the text to the right
        return textView;
    }

    private TextView getTextViewBoldEndAlignmentMedium(String content) {
        TextView textView = getTextViewBold(content);
        textView.setGravity(Gravity.END); // Aligns the text to the right
        textView.setTextSize(18);
        return textView;
    }

    private TextView getTextViewBold(String content) {
        TextView textView = getTextView(content);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        return textView;
    }

    private TextView getTextView(String content) {
        TextView textView = new TextView(context);
        textView.setText(content);
        textView.setTextColor(Color.BLACK);
        textView.setBackgroundColor(Color.WHITE);
        textView.setTextSize(12);
        textView.setMaxWidth(MAX_WIDTH);

        textView.setLayoutParams(getLayoutParams());
        textView.getLayoutParams().width = LinearLayout.LayoutParams.MATCH_PARENT;

        return textView;
    }

    private ViewGroup.LayoutParams getLayoutParams() {
        int width = LinearLayout.LayoutParams.MATCH_PARENT;
        int height = LinearLayout.LayoutParams.WRAP_CONTENT;
        return new LinearLayout.LayoutParams(width, height);
    }

    ;
}
