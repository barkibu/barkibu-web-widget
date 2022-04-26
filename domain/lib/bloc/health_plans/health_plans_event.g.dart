// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_plans_event.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HealthPlansRequested extends HealthPlansRequested {
  @override
  final int petId;

  factory _$HealthPlansRequested(
          [void Function(HealthPlansRequestedBuilder) updates]) =>
      (new HealthPlansRequestedBuilder()..update(updates)).build();

  _$HealthPlansRequested._({this.petId}) : super._() {
    if (petId == null) {
      throw new BuiltValueNullFieldError('HealthPlansRequested', 'petId');
    }
  }

  @override
  HealthPlansRequested rebuild(
          void Function(HealthPlansRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthPlansRequestedBuilder toBuilder() =>
      new HealthPlansRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthPlansRequested && petId == other.petId;
  }

  @override
  int get hashCode {
    return $jf($jc(0, petId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthPlansRequested')
          ..add('petId', petId))
        .toString();
  }
}

class HealthPlansRequestedBuilder
    implements Builder<HealthPlansRequested, HealthPlansRequestedBuilder> {
  _$HealthPlansRequested _$v;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  HealthPlansRequestedBuilder();

  HealthPlansRequestedBuilder get _$this {
    if (_$v != null) {
      _petId = _$v.petId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthPlansRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HealthPlansRequested;
  }

  @override
  void update(void Function(HealthPlansRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthPlansRequested build() {
    final _$result = _$v ?? new _$HealthPlansRequested._(petId: petId);
    replace(_$result);
    return _$result;
  }
}

class _$HealthPlanViewRequested extends HealthPlanViewRequested {
  @override
  final String healthPlanKey;
  @override
  final int petId;

  factory _$HealthPlanViewRequested(
          [void Function(HealthPlanViewRequestedBuilder) updates]) =>
      (new HealthPlanViewRequestedBuilder()..update(updates)).build();

  _$HealthPlanViewRequested._({this.healthPlanKey, this.petId}) : super._() {
    if (healthPlanKey == null) {
      throw new BuiltValueNullFieldError(
          'HealthPlanViewRequested', 'healthPlanKey');
    }
    if (petId == null) {
      throw new BuiltValueNullFieldError('HealthPlanViewRequested', 'petId');
    }
  }

  @override
  HealthPlanViewRequested rebuild(
          void Function(HealthPlanViewRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthPlanViewRequestedBuilder toBuilder() =>
      new HealthPlanViewRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthPlanViewRequested &&
        healthPlanKey == other.healthPlanKey &&
        petId == other.petId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, healthPlanKey.hashCode), petId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthPlanViewRequested')
          ..add('healthPlanKey', healthPlanKey)
          ..add('petId', petId))
        .toString();
  }
}

class HealthPlanViewRequestedBuilder
    implements
        Builder<HealthPlanViewRequested, HealthPlanViewRequestedBuilder> {
  _$HealthPlanViewRequested _$v;

  String _healthPlanKey;
  String get healthPlanKey => _$this._healthPlanKey;
  set healthPlanKey(String healthPlanKey) =>
      _$this._healthPlanKey = healthPlanKey;

  int _petId;
  int get petId => _$this._petId;
  set petId(int petId) => _$this._petId = petId;

  HealthPlanViewRequestedBuilder();

  HealthPlanViewRequestedBuilder get _$this {
    if (_$v != null) {
      _healthPlanKey = _$v.healthPlanKey;
      _petId = _$v.petId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthPlanViewRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HealthPlanViewRequested;
  }

  @override
  void update(void Function(HealthPlanViewRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthPlanViewRequested build() {
    final _$result = _$v ??
        new _$HealthPlanViewRequested._(
            healthPlanKey: healthPlanKey, petId: petId);
    replace(_$result);
    return _$result;
  }
}

class _$BenefitsInformationRequested extends BenefitsInformationRequested {
  @override
  final String planName;

  factory _$BenefitsInformationRequested(
          [void Function(BenefitsInformationRequestedBuilder) updates]) =>
      (new BenefitsInformationRequestedBuilder()..update(updates)).build();

  _$BenefitsInformationRequested._({this.planName}) : super._() {
    if (planName == null) {
      throw new BuiltValueNullFieldError(
          'BenefitsInformationRequested', 'planName');
    }
  }

  @override
  BenefitsInformationRequested rebuild(
          void Function(BenefitsInformationRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BenefitsInformationRequestedBuilder toBuilder() =>
      new BenefitsInformationRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BenefitsInformationRequested && planName == other.planName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, planName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BenefitsInformationRequested')
          ..add('planName', planName))
        .toString();
  }
}

class BenefitsInformationRequestedBuilder
    implements
        Builder<BenefitsInformationRequested,
            BenefitsInformationRequestedBuilder> {
  _$BenefitsInformationRequested _$v;

  String _planName;
  String get planName => _$this._planName;
  set planName(String planName) => _$this._planName = planName;

  BenefitsInformationRequestedBuilder();

  BenefitsInformationRequestedBuilder get _$this {
    if (_$v != null) {
      _planName = _$v.planName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BenefitsInformationRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BenefitsInformationRequested;
  }

  @override
  void update(void Function(BenefitsInformationRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BenefitsInformationRequested build() {
    final _$result =
        _$v ?? new _$BenefitsInformationRequested._(planName: planName);
    replace(_$result);
    return _$result;
  }
}

class _$HealthPlansBarkibuInformationRequested
    extends HealthPlansBarkibuInformationRequested {
  factory _$HealthPlansBarkibuInformationRequested(
          [void Function(HealthPlansBarkibuInformationRequestedBuilder)
              updates]) =>
      (new HealthPlansBarkibuInformationRequestedBuilder()..update(updates))
          .build();

  _$HealthPlansBarkibuInformationRequested._() : super._();

  @override
  HealthPlansBarkibuInformationRequested rebuild(
          void Function(HealthPlansBarkibuInformationRequestedBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthPlansBarkibuInformationRequestedBuilder toBuilder() =>
      new HealthPlansBarkibuInformationRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthPlansBarkibuInformationRequested;
  }

  @override
  int get hashCode {
    return 146386276;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('HealthPlansBarkibuInformationRequested')
        .toString();
  }
}

class HealthPlansBarkibuInformationRequestedBuilder
    implements
        Builder<HealthPlansBarkibuInformationRequested,
            HealthPlansBarkibuInformationRequestedBuilder> {
  _$HealthPlansBarkibuInformationRequested _$v;

  HealthPlansBarkibuInformationRequestedBuilder();

  @override
  void replace(HealthPlansBarkibuInformationRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HealthPlansBarkibuInformationRequested;
  }

  @override
  void update(
      void Function(HealthPlansBarkibuInformationRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthPlansBarkibuInformationRequested build() {
    final _$result = _$v ?? new _$HealthPlansBarkibuInformationRequested._();
    replace(_$result);
    return _$result;
  }
}

class _$BuyHealthPlanRequested extends BuyHealthPlanRequested {
  @override
  final String planName;

  factory _$BuyHealthPlanRequested(
          [void Function(BuyHealthPlanRequestedBuilder) updates]) =>
      (new BuyHealthPlanRequestedBuilder()..update(updates)).build();

  _$BuyHealthPlanRequested._({this.planName}) : super._() {
    if (planName == null) {
      throw new BuiltValueNullFieldError('BuyHealthPlanRequested', 'planName');
    }
  }

  @override
  BuyHealthPlanRequested rebuild(
          void Function(BuyHealthPlanRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuyHealthPlanRequestedBuilder toBuilder() =>
      new BuyHealthPlanRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuyHealthPlanRequested && planName == other.planName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, planName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BuyHealthPlanRequested')
          ..add('planName', planName))
        .toString();
  }
}

class BuyHealthPlanRequestedBuilder
    implements Builder<BuyHealthPlanRequested, BuyHealthPlanRequestedBuilder> {
  _$BuyHealthPlanRequested _$v;

  String _planName;
  String get planName => _$this._planName;
  set planName(String planName) => _$this._planName = planName;

  BuyHealthPlanRequestedBuilder();

  BuyHealthPlanRequestedBuilder get _$this {
    if (_$v != null) {
      _planName = _$v.planName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuyHealthPlanRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BuyHealthPlanRequested;
  }

  @override
  void update(void Function(BuyHealthPlanRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BuyHealthPlanRequested build() {
    final _$result = _$v ?? new _$BuyHealthPlanRequested._(planName: planName);
    replace(_$result);
    return _$result;
  }
}

class _$FAQHealthPlanRequested extends FAQHealthPlanRequested {
  @override
  final String planName;

  factory _$FAQHealthPlanRequested(
          [void Function(FAQHealthPlanRequestedBuilder) updates]) =>
      (new FAQHealthPlanRequestedBuilder()..update(updates)).build();

  _$FAQHealthPlanRequested._({this.planName}) : super._() {
    if (planName == null) {
      throw new BuiltValueNullFieldError('FAQHealthPlanRequested', 'planName');
    }
  }

  @override
  FAQHealthPlanRequested rebuild(
          void Function(FAQHealthPlanRequestedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FAQHealthPlanRequestedBuilder toBuilder() =>
      new FAQHealthPlanRequestedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FAQHealthPlanRequested && planName == other.planName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, planName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('FAQHealthPlanRequested')
          ..add('planName', planName))
        .toString();
  }
}

class FAQHealthPlanRequestedBuilder
    implements Builder<FAQHealthPlanRequested, FAQHealthPlanRequestedBuilder> {
  _$FAQHealthPlanRequested _$v;

  String _planName;
  String get planName => _$this._planName;
  set planName(String planName) => _$this._planName = planName;

  FAQHealthPlanRequestedBuilder();

  FAQHealthPlanRequestedBuilder get _$this {
    if (_$v != null) {
      _planName = _$v.planName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FAQHealthPlanRequested other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FAQHealthPlanRequested;
  }

  @override
  void update(void Function(FAQHealthPlanRequestedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FAQHealthPlanRequested build() {
    final _$result = _$v ?? new _$FAQHealthPlanRequested._(planName: planName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
