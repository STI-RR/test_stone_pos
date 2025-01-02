package core.util

import android.content.Context
import android.os.AsyncTask
import br.com.stirr.easyfood.app.easyfood_app.NativeMethodChannel
import core.entity.Impressora
import core.entity.ImpressoraFactory
import core.entity.relatorio.RelatorioEntity
import core.usecase.ImprimirRelatorioUseCase

class BackgroundPrinterRelatorio(val context: Context) : AsyncTask<RelatorioEntity?, String, Void?>() {
    override fun doInBackground(vararg p0: RelatorioEntity?): Void? {
        try {
            val relatorio = p0[0]
            val callback: Impressora.Callback = object : Impressora.Callback {
                override fun onSuccess() {
                    publishProgress()
                }

                override fun onError(message: String) {
                    publishProgress(message)
                }
            }
            val useCase = ImprimirRelatorioUseCase()
            val useCaseParams = ImprimirRelatorioUseCase.Params(
                    context,
                    relatorio,
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
