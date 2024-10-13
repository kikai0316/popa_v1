import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class InitialPage extends HookConsumerWidget {
  const InitialPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final safeAreaHeight = safeHeight(context);
    final safeAreaWidth = MediaQuery.of(context).size.width;
//  final pageIndexState = ref.watch(pageIndexNotifierProvider);
// final int pageIndex = pageIndexState.value;

    useEffect(
      () {
        SchedulerBinding.instance.addPostFrameCallback((_) async {});
        return;
      },
      [],
    );

    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          backgroundColor: Colors.black,
          body: const IndexedStack(
              index: 0,
              //pageIndex,
              children: []),
          resizeToAvoidBottomInset: false,
        ),
      ],
    );
  }
}
