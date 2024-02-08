// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartRepositoryHash() => r'db5cf19a485afa185f3ad5650d013f749e7788e0';

/// See also [cartRepository].
@ProviderFor(cartRepository)
final cartRepositoryProvider = AutoDisposeProvider<CartRepository>.internal(
  cartRepository,
  name: r'cartRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartRepositoryRef = AutoDisposeProviderRef<CartRepository>;
String _$getCartHash() => r'd0e1eaa90e4237640914f0a73c72edfa21bb9a23';

/// See also [getCart].
@ProviderFor(getCart)
final getCartProvider = AutoDisposeStreamProvider<Cart>.internal(
  getCart,
  name: r'getCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCartRef = AutoDisposeStreamProviderRef<Cart>;
String _$fetchCartHash() => r'2692f0295a7f22225998042106ac97d070eac3b7';

/// See also [fetchCart].
@ProviderFor(fetchCart)
final fetchCartProvider = AutoDisposeFutureProvider<Cart>.internal(
  fetchCart,
  name: r'fetchCartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchCartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCartRef = AutoDisposeFutureProviderRef<Cart>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
