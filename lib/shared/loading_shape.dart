import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/constant.dart';

class LoadingShapeItem extends StatelessWidget {
  const LoadingShapeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: mainColor,
            )
          : const CircularProgressIndicator.adaptive(),
    );
  }
}
