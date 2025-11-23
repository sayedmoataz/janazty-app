import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_navigation_provider.g.dart';

@riverpod
class AppNavigationNotifier extends _$AppNavigationNotifier {
  @override
  int build() {
    return 0; // Default to first screen (Home)
  }

  void setIndex(int index) {
    state = index;
  }
}
