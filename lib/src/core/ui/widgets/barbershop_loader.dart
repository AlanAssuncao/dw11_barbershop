import 'package:dw11_barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BarbershopLoader extends StatelessWidget {
  const BarbershopLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
        color: ColorsContants.brow,
        size: 60,
      ),
    );
  }
}
