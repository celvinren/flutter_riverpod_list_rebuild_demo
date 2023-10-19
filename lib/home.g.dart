// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listCountHash() => r'6ae407640d7867dc57ab2f9eeee84cc1feefcab1';

/// See also [listCount].
@ProviderFor(listCount)
final listCountProvider = AutoDisposeProvider<int>.internal(
  listCount,
  name: r'listCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ListCountRef = AutoDisposeProviderRef<int>;
String _$getCellDataHash() => r'e6639f0709c28540f3c88f9a2037a65d873722ed';

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

abstract class _$GetCellData extends BuildlessAutoDisposeNotifier<int> {
  late final int row;
  late final int column;

  int build(
    int row,
    int column,
  );
}

/// See also [GetCellData].
@ProviderFor(GetCellData)
const getCellDataProvider = GetCellDataFamily();

/// See also [GetCellData].
class GetCellDataFamily extends Family<int> {
  /// See also [GetCellData].
  const GetCellDataFamily();

  /// See also [GetCellData].
  GetCellDataProvider call(
    int row,
    int column,
  ) {
    return GetCellDataProvider(
      row,
      column,
    );
  }

  @override
  GetCellDataProvider getProviderOverride(
    covariant GetCellDataProvider provider,
  ) {
    return call(
      provider.row,
      provider.column,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCellDataProvider';
}

/// See also [GetCellData].
class GetCellDataProvider
    extends AutoDisposeNotifierProviderImpl<GetCellData, int> {
  /// See also [GetCellData].
  GetCellDataProvider(
    int row,
    int column,
  ) : this._internal(
          () => GetCellData()
            ..row = row
            ..column = column,
          from: getCellDataProvider,
          name: r'getCellDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCellDataHash,
          dependencies: GetCellDataFamily._dependencies,
          allTransitiveDependencies:
              GetCellDataFamily._allTransitiveDependencies,
          row: row,
          column: column,
        );

  GetCellDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.row,
    required this.column,
  }) : super.internal();

  final int row;
  final int column;

  @override
  int runNotifierBuild(
    covariant GetCellData notifier,
  ) {
    return notifier.build(
      row,
      column,
    );
  }

  @override
  Override overrideWith(GetCellData Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetCellDataProvider._internal(
        () => create()
          ..row = row
          ..column = column,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        row: row,
        column: column,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<GetCellData, int> createElement() {
    return _GetCellDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCellDataProvider &&
        other.row == row &&
        other.column == column;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, row.hashCode);
    hash = _SystemHash.combine(hash, column.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCellDataRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `row` of this provider.
  int get row;

  /// The parameter `column` of this provider.
  int get column;
}

class _GetCellDataProviderElement
    extends AutoDisposeNotifierProviderElement<GetCellData, int>
    with GetCellDataRef {
  _GetCellDataProviderElement(super.provider);

  @override
  int get row => (origin as GetCellDataProvider).row;
  @override
  int get column => (origin as GetCellDataProvider).column;
}

String _$dataListHash() => r'4a296518688f5db9b9979954bac64455aca385bc';

/// See also [DataList].
@ProviderFor(DataList)
final dataListProvider =
    AutoDisposeNotifierProvider<DataList, List<List<int>>>.internal(
  DataList.new,
  name: r'dataListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataList = AutoDisposeNotifier<List<List<int>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
