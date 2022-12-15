import 'package:sqlite_curso/core/presentation/constants/responsiveness.dart';
import 'package:sqlite_curso/features/produtos/presentation/components/crud/devices/desktop.dart';
import 'package:sqlite_curso/features/produtos/presentation/components/crud/devices/mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProdutosFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: kDesktopBreakpoint,
            height: MediaQuery.of(context).size.height * 0.8,
          ),
          child: ResponsiveVisibility(
            visible: false,
            visibleWhen: [
              Condition.smallerThan(name: DESKTOP),
            ],
            child: MobileForm(),
            replacement: DesktopForm(),
          ),
        ),
      ),
    );
  }
}
