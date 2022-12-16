import 'package:get_it/get_it.dart';
import 'package:sqlite_curso/core/presentation/theme.dart';
import 'package:sqlite_curso/features/boasvindas/data/datasources/boasvindas_datasource.dart';
import 'package:sqlite_curso/features/boasvindas/presentation/pages/boasvindas.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sqlite_curso/core/presentation/constants/responsiveness.dart';
import 'package:sqlite_curso/features/produtos/presentation/mobx_store/produto_store.dart';
import 'features/produtos/presentation/pages/crud.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  GetIt.I.registerSingleton<ProdutoStore>(ProdutoStore());
  runApp(ECDeliveryApp());
}

class ECDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EC Delivery',
      theme: theme(),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        // widget,
        minWidth: 410,
        // maxWidth: 2600,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(410, name: MOBILE),
          ResponsiveBreakpoint.autoScale(560, name: TABLET),
          ResponsiveBreakpoint.resize(kDesktopBreakpoint, name: DESKTOP),
        ],
        backgroundColor: Colors.indigo.shade600,
      ),
      home: FutureBuilder(
        future: _buildHome(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data;
          }

          return Container();
        },
      ),
    );
  }

  Future<Widget> _buildHome() async {
    if (await BoasVindasDataSource.getDontShowAgain()) {
      return ProdutosCRUDPage();
    }

    return BoasVindasPage();
  }
}
