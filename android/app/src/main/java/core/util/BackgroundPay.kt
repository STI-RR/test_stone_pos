package core.util

import android.content.Context
import android.os.AsyncTask
import br.com.stirr.easyfood.app.easyfood_app.NativeMethodChannel
import core.entity.AdquirenteFactory
import core.entity.cobranca.Adquirente
import core.entity.cobranca.AtualizacaoPagamentoEntity
import core.entity.cobranca.ConclusaoPagamentoEntity
import core.entity.cobranca.RequisicaoPagamentoEntity
import core.usecase.RealizarCobrancaUseCase

class BackgroundPay(val context: Context) : AsyncTask<RequisicaoPagamentoEntity, Any, Void?>() {
    override fun doInBackground(vararg p0: RequisicaoPagamentoEntity): Void? {
        try {
            val request = p0[0]
            val callback: Adquirente.Callback = object : Adquirente.Callback {
                override fun onProgress(progress: AtualizacaoPagamentoEntity?) {
                    publishProgress(progress)
                }

                override fun onFinish(result: ConclusaoPagamentoEntity?) {
                    if (result != null) {
                        publishProgress(result)
                    }
                }

            }
            val useCase = RealizarCobrancaUseCase()
            val useCaseParams = RealizarCobrancaUseCase.Params(
                    context,
                    request,
                    AdquirenteFactory.getInstance(context),
                    callback
            )
            useCase.call(useCaseParams)
        } catch (e: Exception) {
            val error = ConclusaoPagamentoEntity(false);
            error.errorMessage = e.message ?: "Erro desconhecido"
            publishProgress(error)
        }
        return null
    }

    override fun onProgressUpdate(vararg values: Any) {
        if (!values.isEmpty()) {
            val event = values[0]

            if (event is AtualizacaoPagamentoEntity) {
                NativeMethodChannel.paymentUpdate(event)
            } else if (event is ConclusaoPagamentoEntity) {
                NativeMethodChannel.paymentComplete(event)
            }
        }
    }
}
