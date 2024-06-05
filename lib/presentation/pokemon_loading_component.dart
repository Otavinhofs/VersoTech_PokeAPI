import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'assets_paths.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Lottie.asset(pokeballLoadingJson),
        ),
      ),
    );
  }
}
