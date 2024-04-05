// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getServiceHash() => r'dbc3c7b67653ba8c5d81aef2e865b9301f6d00fa';

/// See also [getService].
@ProviderFor(getService)
final getServiceProvider =
    AutoDisposeStreamProvider<List<ServiceEntity>>.internal(
  getService,
  name: r'getServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetServiceRef = AutoDisposeStreamProviderRef<List<ServiceEntity>>;
String _$serviceHash() => r'd8a852c83c9eabe5e924ea5ed1497cb1ebf36d30';

/// See also [Service].
@ProviderFor(Service)
final serviceProvider = AutoDisposeNotifierProvider<Service, void>.internal(
  Service.new,
  name: r'serviceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Service = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
