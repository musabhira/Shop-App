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
String _$serviceHash() => r'43c4fa4c18d4d67c8dd3d8587e77a42c513f7e1e';

/// See also [Service].
@ProviderFor(Service)
final serviceProvider = NotifierProvider<Service, ServiceState>.internal(
  Service.new,
  name: r'serviceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$serviceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Service = Notifier<ServiceState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
