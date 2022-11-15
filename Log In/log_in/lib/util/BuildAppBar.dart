// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

AppBar BuildAppBar(BuildContext context) {
  return AppBar(
    leading: BackButton(),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
