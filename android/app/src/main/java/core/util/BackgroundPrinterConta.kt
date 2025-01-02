package core.util

import android.content.Context
import android.os.AsyncTask
import br.com.stirr.easyfood.app.easyfood_app.NativeMethodChannel
import core.entity.Impressora
import core.entity.ImpressoraFactory
import core.entity.ReciboContaEntity
import core.usecase.ImprimirContaUseCase

class BackgroundPrinterConta(val context: Context) : AsyncTask<ReciboContaEntity?, String, Void?>() {
    override fun doInBackground(vararg p0: ReciboContaEntity?): Void? {
        try {
            val recibo = p0[0]
            val callback: Impressora.Callback = object : Impressora.Callback {
                override fun onSuccess() {
                    publishProgress()
                }

                override fun onError(message: String) {
                    publishProgress(message)
                }
            }
            val useCase = ImprimirContaUseCase()
            val useCaseParams = ImprimirContaUseCase.Params(
                    context,
                    recibo,
                    ImpressoraFactory.getInstance(context),
                    callback
            )
            useCase.call(useCaseParams)
        } catch (e: Exception) {
            publishProgress(e.message ?: "Erro desconhecido")
        }
        return null
    }

    override fun onProgressUpdate(vararg values: String) {
        if (values.isEmpty()) {
            NativeMethodChannel.printSuccess()
        } else {
            val errorMessage = values[0];
            NativeMethodChannel.printError(errorMessage)
        }
    }
}
