// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funeral_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(funeralRemoteDataSource)
const funeralRemoteDataSourceProvider = FuneralRemoteDataSourceProvider._();

final class FuneralRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          FuneralRemoteDataSource,
          FuneralRemoteDataSource,
          FuneralRemoteDataSource
        >
    with $Provider<FuneralRemoteDataSource> {
  const FuneralRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'funeralRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$funeralRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<FuneralRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FuneralRemoteDataSource create(Ref ref) {
    return funeralRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FuneralRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FuneralRemoteDataSource>(value),
    );
  }
}

String _$funeralRemoteDataSourceHash() =>
    r'27ba1f76ab79d769ea3b0b5c9747232a132ed90c';

@ProviderFor(funeralRepository)
const funeralRepositoryProvider = FuneralRepositoryProvider._();

final class FuneralRepositoryProvider
    extends
        $FunctionalProvider<
          FuneralRepository,
          FuneralRepository,
          FuneralRepository
        >
    with $Provider<FuneralRepository> {
  const FuneralRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'funeralRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$funeralRepositoryHash();

  @$internal
  @override
  $ProviderElement<FuneralRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FuneralRepository create(Ref ref) {
    return funeralRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FuneralRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FuneralRepository>(value),
    );
  }
}

String _$funeralRepositoryHash() => r'f711be8c2d04bf726b9e9db0eff10eb0ea0bde68';

@ProviderFor(funerals)
const funeralsProvider = FuneralsProvider._();

final class FuneralsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FuneralEntity>>,
          List<FuneralEntity>,
          Stream<List<FuneralEntity>>
        >
    with
        $FutureModifier<List<FuneralEntity>>,
        $StreamProvider<List<FuneralEntity>> {
  const FuneralsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'funeralsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$funeralsHash();

  @$internal
  @override
  $StreamProviderElement<List<FuneralEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<FuneralEntity>> create(Ref ref) {
    return funerals(ref);
  }
}

String _$funeralsHash() => r'b7ab75a9ca63f8077dd55f7ca29ce36b42069c4e';

@ProviderFor(funeralById)
const funeralByIdProvider = FuneralByIdFamily._();

final class FuneralByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<FuneralEntity>,
          FuneralEntity,
          FutureOr<FuneralEntity>
        >
    with $FutureModifier<FuneralEntity>, $FutureProvider<FuneralEntity> {
  const FuneralByIdProvider._({
    required FuneralByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'funeralByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$funeralByIdHash();

  @override
  String toString() {
    return r'funeralByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<FuneralEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<FuneralEntity> create(Ref ref) {
    final argument = this.argument as String;
    return funeralById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FuneralByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$funeralByIdHash() => r'86d59dda171d2254e0ac54504ecfeb7b4ebf82c5';

final class FuneralByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<FuneralEntity>, String> {
  const FuneralByIdFamily._()
    : super(
        retry: null,
        name: r'funeralByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FuneralByIdProvider call(String id) =>
      FuneralByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'funeralByIdProvider';
}

@ProviderFor(prayCount)
const prayCountProvider = PrayCountFamily._();

final class PrayCountProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const PrayCountProvider._({
    required PrayCountFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'prayCountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$prayCountHash();

  @override
  String toString() {
    return r'prayCountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as String;
    return prayCount(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PrayCountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$prayCountHash() => r'708d7f4620d97631082178d8db9a17c373d9eb63';

final class PrayCountFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, String> {
  const PrayCountFamily._()
    : super(
        retry: null,
        name: r'prayCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PrayCountProvider call(String funeralId) =>
      PrayCountProvider._(argument: funeralId, from: this);

  @override
  String toString() => r'prayCountProvider';
}
