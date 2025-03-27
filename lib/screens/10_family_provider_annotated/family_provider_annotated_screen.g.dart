// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_provider_annotated_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'0a3776cde2e840a4c991d3a05e23cbbc7719d8ff';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [user].
@ProviderFor(user)
const userProvider = UserFamily();

/// See also [user].
class UserFamily extends Family<AsyncValue<Map<String, String>>> {
  /// See also [user].
  const UserFamily();

  /// See also [user].
  UserProvider call(int id) {
    return UserProvider(id);
  }

  @override
  UserProvider getProviderOverride(covariant UserProvider provider) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProvider';
}

/// See also [user].
class UserProvider extends AutoDisposeFutureProvider<Map<String, String>> {
  /// See also [user].
  UserProvider(int id)
    : this._internal(
        (ref) => user(ref as UserRef, id),
        from: userProvider,
        name: r'userProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
        dependencies: UserFamily._dependencies,
        allTransitiveDependencies: UserFamily._allTransitiveDependencies,
        id: id,
      );

  UserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Map<String, String>> Function(UserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserProvider._internal(
        (ref) => create(ref as UserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Map<String, String>> createElement() {
    return _UserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserRef on AutoDisposeFutureProviderRef<Map<String, String>> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UserProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, String>>
    with UserRef {
  _UserProviderElement(super.provider);

  @override
  int get id => (origin as UserProvider).id;
}

String _$numberFormatterHash() => r'7161694e50d8443a6dbc6ebf69bb773d4c85cc92';

/// See also [numberFormatter].
@ProviderFor(numberFormatter)
const numberFormatterProvider = NumberFormatterFamily();

/// See also [numberFormatter].
class NumberFormatterFamily extends Family<String> {
  /// See also [numberFormatter].
  const NumberFormatterFamily();

  /// See also [numberFormatter].
  NumberFormatterProvider call(double number) {
    return NumberFormatterProvider(number);
  }

  @override
  NumberFormatterProvider getProviderOverride(
    covariant NumberFormatterProvider provider,
  ) {
    return call(provider.number);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'numberFormatterProvider';
}

/// See also [numberFormatter].
class NumberFormatterProvider extends AutoDisposeProvider<String> {
  /// See also [numberFormatter].
  NumberFormatterProvider(double number)
    : this._internal(
        (ref) => numberFormatter(ref as NumberFormatterRef, number),
        from: numberFormatterProvider,
        name: r'numberFormatterProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$numberFormatterHash,
        dependencies: NumberFormatterFamily._dependencies,
        allTransitiveDependencies:
            NumberFormatterFamily._allTransitiveDependencies,
        number: number,
      );

  NumberFormatterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.number,
  }) : super.internal();

  final double number;

  @override
  Override overrideWith(String Function(NumberFormatterRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: NumberFormatterProvider._internal(
        (ref) => create(ref as NumberFormatterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        number: number,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _NumberFormatterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NumberFormatterProvider && other.number == number;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, number.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NumberFormatterRef on AutoDisposeProviderRef<String> {
  /// The parameter `number` of this provider.
  double get number;
}

class _NumberFormatterProviderElement extends AutoDisposeProviderElement<String>
    with NumberFormatterRef {
  _NumberFormatterProviderElement(super.provider);

  @override
  double get number => (origin as NumberFormatterProvider).number;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
