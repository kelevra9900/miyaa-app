import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'loading_state.dart';

class LoadingController extends StateNotifier<LoadingState> {
  LoadingController() : super(LoadingState());
}

final loadingController =
    StateNotifierProvider<LoadingController, LoadingState>((ref) {
  return LoadingController();
});
