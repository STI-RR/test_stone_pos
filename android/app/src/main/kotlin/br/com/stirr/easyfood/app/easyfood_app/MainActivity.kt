package br.com.stirr.easyfood.app.easyfood_app

import androidx.annotation.NonNull
import core.entity.AdquirenteFactory
import core.entity.ItemFichaEntity
import core.entity.ReciboContaEntity
import core.entity.cobranca.RequisicaoPagamentoEntity
import core.entity.relatorio.RelatorioEntity
import core.usecase.ImprimirViaClienteUseCase
import core.util.BackgroundPay
import core.util.BackgroundPrinterConta
import core.util.BackgroundPrinterFicha
import core.util.BackgroundPrinterRelatorio
import core.util.FlavorInfo
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        NativeMethodChannel.configureChannel(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "flavor").setMethodCallHandler { call, result ->
            if (call.method == "getFlavor") {
                result.success(BuildConfig.FLAVOR)
            } else if (call.method == "print-conta") {
                val args = call.arguments
                val recibo = ReciboContaEntity.fromJsonString(args);
                printConta(recibo, result)
            } else if (call.method == "print-ficha") {
                val args = call.arguments
                val ficha = ItemFichaEntity.fromJsonString(args);
                printFicha(ficha, result)
            } else if (call.method == "pay") {
                val args = call.arguments
                val request = RequisicaoPagamentoEntity.fromJsonString(args)
                pay(request, result)
            } else if (call.method == "cancel-pay") {
                cancelPay();
            } else if (call.method == "print-customer-receipt") {
                printCustomerReceipt()
            } else if (call.method == "get-flavor-info") {
                val flavorInfo = FlavorInfo()
                result.success(flavorInfo.getInfo(this))
            } else if (call.method == "activateSdk") {
                val adquirente = AdquirenteFactory.getInstance(this)
                val args = call.arguments as? String ?: null
                adquirente.inicializarSdk(applicationContext, args)
            } else if (call.method == "reprint-customer-receipt") {
                val adquirente = AdquirenteFactory.getInstance(this)
                adquirente.reimprimirViaCliente(call.arguments as String)
            } else if (call.method == "reprint-merchant-receipt") {
                val adquirente = AdquirenteFactory.getInstance(this)
                adquirente.reimprimirViaEstabelecimento(call.arguments as String)
            } else if (call.method == "print-report") {
                val args = call.arguments
                val report = RelatorioEntity.fromJsonString(args)
                printReport(report);
            } else {
                result.notImplemented()
            }
        }
    }

    fun printConta(recibo: ReciboContaEntity, result: MethodChannel.Result) {
        val task = BackgroundPrinterConta(this)
        task.execute(recibo)
    }

    fun printFicha(ficha: ItemFichaEntity, result: MethodChannel.Result) {
        val task = BackgroundPrinterFicha(this)
        task.execute(ficha)
    }

    fun printReport(relatorio: RelatorioEntity) {
        val task = BackgroundPrinterRelatorio(this)
        task.execute(relatorio)
    }

    fun pay(request: RequisicaoPagamentoEntity, result: MethodChannel.Result) {
        val task = BackgroundPay(this)
        task.execute(request)
    }

    fun cancelPay() {
        AdquirenteFactory.getInstance(this).cancelarPagamento()
    }

    fun printCustomerReceipt() {
        val adquirente = AdquirenteFactory.getInstance(this)
        val paramas = ImprimirViaClienteUseCase.Params(adquirente)
        ImprimirViaClienteUseCase().call(paramas)
    }

}
