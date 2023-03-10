import 'package:sqlite_curso/core/presentation/constants/responsiveness.dart';
import 'package:sqlite_curso/features/boasvindas/presentation/components/bottom_row.dart';
import 'package:sqlite_curso/features/boasvindas/presentation/components/welcome_text.dart';
import 'package:sqlite_curso/shared/presentation/components/brand/brand_image.dart';
import 'package:sqlite_curso/shared/presentation/components/brand/brand_title.dart';
import 'package:flutter/material.dart';

class BoasVindasContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: kDesktopBreakpoint,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BrandTitleWidget(),
            BrandImageWidget(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.contain,
            ),
            WelcomeTextWidget(),
            BottomRowBoasVindasWidget(),
          ],
        ),
      ),
    );
  }
}
