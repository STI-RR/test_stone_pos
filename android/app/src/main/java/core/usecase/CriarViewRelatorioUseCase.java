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
import java.util.Date;
import java.util.List;
import java.util.Locale;

import core.entity.ItemContaEntity;
import core.entity.ReciboContaEntity;
import core.entity.relatorio.RelatorioEntity;
import core.entity.relatorio.TipoPagamentoRelatorioEntity;
import core.entity.relatorio.TransacaoRelatorioEntity;
import core.util.NumberUtil;
import core.util.PafUtil;

public class CriarViewRelatorioUseCase {

    private final RelatorioEntity relatorio;
    private final Context context;
    private final int MAX_WIDTH = 380;
    private final Locale ptBr = new Locale("pt", "BR");

    public CriarViewRelatorioUseCase(Context context, RelatorioEntity relatorio) {
        this.context = context;
        this.relatorio = relatorio;
    }

    public View call() {
        final String linhaDivisoria = "------------------------------------------------------";
        final String linhaEscapada = "- - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(LinearLayout.VERTICAL);
        PafUtil pafUtil = new PafUtil();

        linearLayout.addView(getTextViewCentralized(relatorio.getNomeEstabelecimento()));
        linearLayout.addView(getTextViewCentralized("Relatório Detalhado por Período"));
        linearLayout.addView(getTextViewSmall("INICIO: " + relatorio.getInicio()));
        linearLayout.addView(getTextViewSmall("FIM: " + relatorio.getFim()));

        linearLayout.addView(getTextView(linhaDivisoria));

        List<TipoPagamentoRelatorioEntity> lista = relatorio.getTiposPagamento();

        for (TipoPagamentoRelatorioEntity bean : lista) {
            linearLayout.addView(getTextViewSmallBold(bean.getTipoPagamento()));
            linearLayout.addView(getTextViewSmallBold("Conta                Data/Hora                          Valor(R$)"));
            linearLayout.addView(getTextView(linhaEscapada));


            for (TransacaoRelatorioEntity transacao : bean.getTransacoes()) {
                linearLayout.addView(getTextViewSmall(pafUtil.rFill(transacao.getConta().toString(), 16)
                        + pafUtil.rFill(transacao.getDataHora(), 32)
                        + pafUtil.lFill(transacao.getValor(), 9, " ")));
            }

            linearLayout.addView(getTextViewSmallBoldAlignmentEnd("Total(R$): " + NumberUtil.formataDecimal2Casas(bean.getTotal())));
            linearLayout.addView(getTextView(linhaEscapada));
        }

        linearLayout.addView(getTextViewSmall(""));
        linearLayout.addView(getTextViewSmallBoldAlignmentEnd("Total Geral(R$): " + NumberUtil.formataDecimal2Casas(relatorio.getTotal())));

        linearLayout.addView(getTextView(linhaDivisoria));

        linearLayout.addView(getTextViewSmall(""));
        linearLayout.addView(getTextViewSmallCentralized(rodape()));
        linearLayout.addView(getTextViewSmall(""));
        linearLayout.addView(getTextViewSmallCentralized("Desenvolvido em Roraima por STIRR"));
        linearLayout.addView(getTextViewSmallCentralized("www.stirr.com.br / (95)98111-2691"));

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

    private TextView getTextViewSmall(String content) {
        TextView textView = new TextView(context);
        textView.setText(content);
        textView.setTextColor(Color.BLACK);
        textView.setBackgroundColor(Color.WHITE);
        textView.setTextSize(8);
        return textView;
    }

    private TextView getTextViewSmallBold(String content) {
        TextView textView = new TextView(context);
        textView.setText(content);
        textView.setTextColor(Color.BLACK);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setBackgroundColor(Color.WHITE);
        textView.setTextSize(8);
        return textView;
    }

    private TextView getTextViewSmallBoldAlignmentEnd(String content) {
        TextView textView = new TextView(context);
        textView.setText(content);
        textView.setTextColor(Color.BLACK);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        textView.setBackgroundColor(Color.WHITE);
        textView.setTextSize(8);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_END);
        return textView;
    }

    private TextView getTextViewSmallCentralized(String content) {
        TextView textView = getTextView(content);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        textView.setTextSize(8);
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
