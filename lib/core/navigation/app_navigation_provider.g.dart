// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_navigation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppNavigationNotifier)
const appNavigationProvider = AppNavigationNotifierProvider._();

final class AppNavigationNotifierProvider
    extends $NotifierProvider<AppNavigationNotifier, int> {
  const AppNavigationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appNavigationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appNavigationNotifierHash();

  @$internal
  @override
  AppNavigationNotifier create() => AppNavigationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$appNavigationNotifierHash() =>
    r'6e882db52856d9cf8126ff0cff56c6e27af24691';

abstract class _$AppNavigationNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
