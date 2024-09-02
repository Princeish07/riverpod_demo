// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$grandTotalHash() => r'd2aa04ba4eadacf5276301d4b851691b9c428f88';

/// See also [grandTotal].
@ProviderFor(grandTotal)
final grandTotalProvider = AutoDisposeProvider<int>.internal(
  grandTotal,
  name: r'grandTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$grandTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GrandTotalRef = AutoDisposeProviderRef<int>;
String _$orderProviderHash() => r'21afa2968308315362c6efc2d66c25e859291a1f';

/// See also [OrderProvider].
@ProviderFor(OrderProvider)
final orderProviderProvider =
    AutoDisposeNotifierProvider<OrderProvider, List<OrderModel>>.internal(
  OrderProvider.new,
  name: r'orderProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$orderProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$OrderProvider = AutoDisposeNotifier<List<OrderModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
