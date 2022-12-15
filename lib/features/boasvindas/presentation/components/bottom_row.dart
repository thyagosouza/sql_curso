import 'package:sqlite_curso/features/boasvindas/data/datasources/boasvindas_datasource.dart';
import 'package:sqlite_curso/features/produtos/presentation/pages/crud.dart';
import 'package:sqlite_curso/shared/presentation/components/buttons/default_text_button.dart';
import 'package:sqlite_curso/shared/presentation/components/checkbox/checkbox.dart';
import 'package:flutter/material.dart';

class BottomRowBoasVindasWidget extends StatelessWidget {
  bool _checkedBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckBoxWidget(
          text: 'Não exibir mais',
          onChanged: (value) {
            _checkedBoxValue = value;
          },
        ),
        DefaultTextButton(
          text: 'Avançar',
          textFontSize: 24,
          onPressed: () async {
            await BoasVindasDataSource.registerDontShowAgain(
                value: _checkedBoxValue);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProdutosCRUDPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
