package core.util

import android.content.Context
import android.os.AsyncTask
import br.com.stirr.easyfood.app.easyfood_app.NativeMethodChannel
import core.entity.Impressora
import core.entity.ImpressoraFactory
import core.entity.ItemFichaEntity
import core.usecase.ImprimirFichaUseCase

class BackgroundPrinterFicha(val context: Context) : AsyncTask<ItemFichaEntity?, String, Void?>() {
    override fun doInBackground(vararg p0: ItemFichaEntity?): Void? {
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
            val useCase = ImprimirFichaUseCase()
            val useCaseParams = ImprimirFichaUseCase.Params(
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
