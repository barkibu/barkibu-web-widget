// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinics_finder_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicsFinderAddressStarted extends ClinicsFinderAddressStarted {
  @override
  final String address;

  factory _$ClinicsFinderAddressStarted(
          [void Function(ClinicsFinderAddressStartedBuilder) updates]) =>
      (new ClinicsFinderAddressStartedBuilder()..update(updates)).build();

  _$ClinicsFinderAddressStarted._({this.address}) : super._() {
    if (address == null) {
      throw new BuiltValueNullFieldError(
          'ClinicsFinderAddressStarted', 'address');
    }
  }

  @override
  ClinicsFinderAddressStarted rebuild(
          void Function(ClinicsFinderAddressStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicsFinderAddressStartedBuilder toBuilder() =>
      new ClinicsFinderAddressStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicsFinderAddressStarted && address == other.address;
  }

  @override
  int get hashCode {
    return $jf($jc(0, address.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClinicsFinderAddressStarted')
          ..add('address', address))
        .toString();
  }
}

class ClinicsFinderAddressStartedBuilder
    implements
        Builder<ClinicsFinderAddressStarted,
            ClinicsFinderAddressStartedBuilder> {
  _$ClinicsFinderAddressStarted _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  ClinicsFinderAddressStartedBuilder();

  ClinicsFinderAddressStartedBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicsFinderAddressStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClinicsFinderAddressStarted;
  }

  @override
  void update(void Function(ClinicsFinderAddressStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClinicsFinderAddressStarted build() {
    final _$result =
        _$v ?? new _$ClinicsFinderAddressStarted._(address: address);
    replace(_$result);
    return _$result;
  }
}

class _$ClinicsFinderPositionStarted extends ClinicsFinderPositionStarted {
  @override
  final String latitude;
  @override
  final String longitude;

  factory _$ClinicsFinderPositionStarted(
          [void Function(ClinicsFinderPositionStartedBuilder) updates]) =>
      (new ClinicsFinderPositionStartedBuilder()..update(updates)).build();

  _$ClinicsFinderPositionStarted._({this.latitude, this.longitude})
      : super._() {
    if (latitude == null) {
      throw new BuiltValueNullFieldError(
          'ClinicsFinderPositionStarted', 'latitude');
    }
    if (longitude == null) {
      throw new BuiltValueNullFieldError(
          'ClinicsFinderPositionStarted', 'longitude');
    }
  }

  @override
  ClinicsFinderPositionStarted rebuild(
          void Function(ClinicsFinderPositionStartedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicsFinderPositionStartedBuilder toBuilder() =>
      new ClinicsFinderPositionStartedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicsFinderPositionStarted &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, latitude.hashCode), longitude.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClinicsFinderPositionStarted')
          ..add('latitude', latitude)
          ..add('longitude', longitude))
        .toString();
  }
}

class ClinicsFinderPositionStartedBuilder
    implements
        Builder<ClinicsFinderPositionStarted,
            ClinicsFinderPositionStartedBuilder> {
  _$ClinicsFinderPositionStarted _$v;

  String _latitude;
  String get latitude => _$this._latitude;
  set latitude(String latitude) => _$this._latitude = latitude;

  String _longitude;
  String get longitude => _$this._longitude;
  set longitude(String longitude) => _$this._longitude = longitude;

  ClinicsFinderPositionStartedBuilder();

  ClinicsFinderPositionStartedBuilder get _$this {
    if (_$v != null) {
      _latitude = _$v.latitude;
      _longitude = _$v.longitude;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicsFinderPositionStarted other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClinicsFinderPositionStarted;
  }

  @override
  void update(void Function(ClinicsFinderPositionStartedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClinicsFinderPositionStarted build() {
    final _$result = _$v ??
        new _$ClinicsFinderPositionStarted._(
            latitude: latitude, longitude: longitude);
    replace(_$result);
    return _$result;
  }
}

class _$ClinicsFinderGeolocationRefused
    extends ClinicsFinderGeolocationRefused {
  factory _$ClinicsFinderGeolocationRefused(
          [void Function(ClinicsFinderGeolocationRefusedBuilder) updates]) =>
      (new ClinicsFinderGeolocationRefusedBuilder()..update(updates)).build();

  _$ClinicsFinderGeolocationRefused._() : super._();

  @override
  ClinicsFinderGeolocationRefused rebuild(
          void Function(ClinicsFinderGeolocationRefusedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicsFinderGeolocationRefusedBuilder toBuilder() =>
      new ClinicsFinderGeolocationRefusedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicsFinderGeolocationRefused;
  }

  @override
  int get hashCode {
    return 377195023;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('ClinicsFinderGeolocationRefused')
        .toString();
  }
}

class ClinicsFinderGeolocationRefusedBuilder
    implements
        Builder<ClinicsFinderGeolocationRefused,
            ClinicsFinderGeolocationRefusedBuilder> {
  _$ClinicsFinderGeolocationRefused _$v;

  ClinicsFinderGeolocationRefusedBuilder();

  @override
  void replace(ClinicsFinderGeolocationRefused other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClinicsFinderGeolocationRefused;
  }

  @override
  void update(void Function(ClinicsFinderGeolocationRefusedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClinicsFinderGeolocationRefused build() {
    final _$result = _$v ?? new _$ClinicsFinderGeolocationRefused._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
