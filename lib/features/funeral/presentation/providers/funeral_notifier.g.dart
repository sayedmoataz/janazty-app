// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funeral_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FuneralNotifier)
const funeralProvider = FuneralNotifierProvider._();

final class FuneralNotifierProvider
    extends $AsyncNotifierProvider<FuneralNotifier, void> {
  const FuneralNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'funeralProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$funeralNotifierHash();

  @$internal
  @override
  FuneralNotifier create() => FuneralNotifier();
}

String _$funeralNotifierHash() => r'a4b391a3c3eff127ea1f00fa934a1fc1c6e58817';

abstract class _$FuneralNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
