import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../tools/extensions/dimens_extension.dart';

class LoadingPage extends ConsumerStatefulWidget {
  const LoadingPage(this.information, {super.key});
  final Map information;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends ConsumerState<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 100), () {
      context.go(widget.information["nextRoute"]);
    });

    return Scaffold(
      body: SizedBox(
        height: context.height(),
        width: context.width(),
      ),
    );
  }
}
