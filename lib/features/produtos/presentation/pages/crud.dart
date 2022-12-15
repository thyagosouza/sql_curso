import 'package:sqlite_curso/features/boasvindas/data/datasources/boasvindas_datasource.dart';
import 'package:sqlite_curso/features/produtos/presentation/components/crud/form.dart';
import 'package:sqlite_curso/shared/presentation/functions/alertdialog.dart';
import 'package:flutter/material.dart';

class ProdutosCRUDPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('Dados do Produto'),
          onLongPress: () async {
            await BoasVindasDataSource.registerDontShowAgain(value: false);

            showDialogEC(
              context: context,
              title: 'Preferências resetadas',
              content:
                  'As preferências relacionadas à página de boas vindas, foram restauradas.',
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28, left: 8, right: 8),
          child: ProdutosFormWidget(),
        ),
      ),
    );
  }
}
