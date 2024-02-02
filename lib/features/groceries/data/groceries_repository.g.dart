// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groceries_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groceriesHash() => r'9a290e8703b3bc85922aa1942f119ca4ed55d4e7';

/// See also [groceries].
@ProviderFor(groceries)
final groceriesProvider = AutoDisposeStreamProvider<List<Grocery>>.internal(
  groceries,
  name: r'groceriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$groceriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroceriesRef = AutoDisposeStreamProviderRef<List<Grocery>>;
String _$groceriesRepositoryHash() =>
    r'b2651d82ac408b0eb0c2e0879d2df1e332efd7e4';

/// See also [groceriesRepository].
@ProviderFor(groceriesRepository)
final groceriesRepositoryProvider = Provider<GroceriesRepository>.internal(
  groceriesRepository,
  name: r'groceriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groceriesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroceriesRepositoryRef = ProviderRef<GroceriesRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
