package br.com.stirr.easyfood.app.easyfood_app

import core.entity.cobranca.AtualizacaoPagamentoEntity
import core.entity.cobranca.ConclusaoPagamentoEntity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

object NativeMethodChannel {
    private const val CHANNEL_NAME = "br.com.stirr.easyfood.app.easyfood_app/native"
    private lateinit var methodChannel: MethodChannel

    fun configureChannel(flutterEngine: FlutterEngine) {
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_NAME)
    }

    fun printSuccess() {
        methodChannel.invokeMethod("printSuccess", null)
    }

    fun printError(message: String) {
        methodChannel.invokeMethod("printError", message)
    }

    fun paymentUpdate(update: AtualizacaoPagamentoEntity) {
        methodChannel.invokeMethod("paymentUpdate", update.toJson().toString())
    }

    fun paymentComplete(result: ConclusaoPagamentoEntity) {
        methodChannel.invokeMethod("paymentComplete", result.toJson().toString())
    }
}
