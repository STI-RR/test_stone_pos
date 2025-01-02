package core.usecase;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import core.entity.ItemFichaEntity;

public class CriarViewFichaUseCase {

    private final ItemFichaEntity item;
    private final Context context;
    private final int MAX_WIDTH = 380;
    private final Locale ptBr = new Locale("pt", "BR");

    public CriarViewFichaUseCase(Context context, ItemFichaEntity itemFicha) {
        this.context = context;
        this.item = itemFicha;
    }

    public View call() {

        SimpleDateFormat dataFormat = new SimpleDateFormat("dd/MM/yyyy-HH:mm:ss", ptBr);
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(ptBr);

        final String linhaDivisoria = "------------------------------------------------------";
        LinearLayout linearLayout = new LinearLayout(context);
        linearLayout.setOrientation(LinearLayout.VERTICAL);
        linearLayout.setLayoutParams(getLayoutParams());

        linearLayout.addView(getTextViewBoldCentralizedExtra("PEDIDO FICHA"));
        linearLayout.addView(getTextView("CONTA: " + (item.getConta().toString())));
        linearLayout.addView(getTextView("SEQUENCIA: " + item.getIndex() + " DE " + item.getOfIndex()));
        linearLayout.addView(getTextView("IMPRESSÃO: " + dataFormat.format(new Date())));
        linearLayout.addView(getTextView("FUNC.: " + item.getFuncionario()));

        linearLayout.addView(getTextView(linhaDivisoria));
        linearLayout.addView(getTextViewExtra(item.getDescricao()));
        if (item.getObservacao() != null && !item.getObservacao().trim().isEmpty()) {
            linearLayout.addView(getTextView(item.getObservacao()));
        }
        linearLayout.addView(getTextView(linhaDivisoria));

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
        textView.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        return textView;
    }

    private TextView getTextViewCentralizedSmall(String content) {
        TextView textView = getTextViewCentralized(content);
        textView.setTextSize(10);
        return textView;
    }

    private TextView getTextViewBoldCentralized(String content) {
        TextView textView = getTextViewBold(content);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_CENTER);
        return textView;
    }

    private TextView getTextViewBoldCentralizedExtra(String content) {
        TextView textView = getTextViewBoldCentralized(content);
        textView.setTextSize(24);
        return textView;
    }

    private TextView getTextViewEndAlignment(String content) {
        TextView textView = getTextView(content);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_TEXT_END);
        return textView;
    }

    private TextView getTextViewBoldEndAlignmentMedium(String content) {
        TextView textView = getTextViewBold(content);
        textView.setTextAlignment(View.TEXT_ALIGNMENT_TEXT_END);
        textView.setTextSize(18);
        return textView;
    }

    private TextView getTextViewBold(String content) {
        TextView textView = getTextView(content);
        textView.setTypeface(Typeface.DEFAULT_BOLD);
        return textView;
    }

    private TextView getTextViewExtra(String content) {
        TextView textView = getTextView(content);
        textView.setTextSize(24);
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
        int height = LinearLayout.LayoutParams.WRAP_CONTENT;
        return new LinearLayout.LayoutParams(MAX_WIDTH, height);
    }
}

