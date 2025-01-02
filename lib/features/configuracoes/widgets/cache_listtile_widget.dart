import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:easyfood_app/cache_options.dart';
import 'package:easyfood_app/features/common/presentation/widgets/snack_bar_widget.dart';
import 'package:flutter/material.dart';

class CacheListTileWidget extends StatelessWidget {
  const CacheListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Limpar cache'),
      subtitle: const Text('Limpar cache do aplicativo'),
      onTap: () => _clearCache(context),
    );
  }

  void _clearCache(BuildContext context) async {
    final cacheStore = cacheOptions.store;
    if (cacheStore is MemCacheStore) {
      cacheStore.clean();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBarWidget.success(context, 'Cache limpo com sucesso'),
    );
  }
}
