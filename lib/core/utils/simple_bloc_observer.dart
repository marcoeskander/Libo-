import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocobserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(
      change.toString(),
    );

    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
  }
}
