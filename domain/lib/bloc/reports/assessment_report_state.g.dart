// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assessment_report_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AssessmentReportLoadSuccessful extends AssessmentReportLoadSuccessful {
  @override
  final Assessment assessment;

  factory _$AssessmentReportLoadSuccessful(
          [void Function(AssessmentReportLoadSuccessfulBuilder) updates]) =>
      (new AssessmentReportLoadSuccessfulBuilder()..update(updates)).build();

  _$AssessmentReportLoadSuccessful._({this.assessment}) : super._();

  @override
  AssessmentReportLoadSuccessful rebuild(
          void Function(AssessmentReportLoadSuccessfulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssessmentReportLoadSuccessfulBuilder toBuilder() =>
      new AssessmentReportLoadSuccessfulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssessmentReportLoadSuccessful &&
        assessment == other.assessment;
  }

  @override
  int get hashCode {
    return $jf($jc(0, assessment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssessmentReportLoadSuccessful')
          ..add('assessment', assessment))
        .toString();
  }
}

class AssessmentReportLoadSuccessfulBuilder
    implements
        Builder<AssessmentReportLoadSuccessful,
            AssessmentReportLoadSuccessfulBuilder> {
  _$AssessmentReportLoadSuccessful _$v;

  Assessment _assessment;
  Assessment get assessment => _$this._assessment;
  set assessment(Assessment assessment) => _$this._assessment = assessment;

  AssessmentReportLoadSuccessfulBuilder();

  AssessmentReportLoadSuccessfulBuilder get _$this {
    if (_$v != null) {
      _assessment = _$v.assessment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssessmentReportLoadSuccessful other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssessmentReportLoadSuccessful;
  }

  @override
  void update(void Function(AssessmentReportLoadSuccessfulBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssessmentReportLoadSuccessful build() {
    final _$result =
        _$v ?? new _$AssessmentReportLoadSuccessful._(assessment: assessment);
    replace(_$result);
    return _$result;
  }
}

class _$AssessmentReportInitial extends AssessmentReportInitial {
  @override
  final Assessment assessment;

  factory _$AssessmentReportInitial(
          [void Function(AssessmentReportInitialBuilder) updates]) =>
      (new AssessmentReportInitialBuilder()..update(updates)).build();

  _$AssessmentReportInitial._({this.assessment}) : super._();

  @override
  AssessmentReportInitial rebuild(
          void Function(AssessmentReportInitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssessmentReportInitialBuilder toBuilder() =>
      new AssessmentReportInitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssessmentReportInitial && assessment == other.assessment;
  }

  @override
  int get hashCode {
    return $jf($jc(0, assessment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssessmentReportInitial')
          ..add('assessment', assessment))
        .toString();
  }
}

class AssessmentReportInitialBuilder
    implements
        Builder<AssessmentReportInitial, AssessmentReportInitialBuilder> {
  _$AssessmentReportInitial _$v;

  Assessment _assessment;
  Assessment get assessment => _$this._assessment;
  set assessment(Assessment assessment) => _$this._assessment = assessment;

  AssessmentReportInitialBuilder();

  AssessmentReportInitialBuilder get _$this {
    if (_$v != null) {
      _assessment = _$v.assessment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssessmentReportInitial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssessmentReportInitial;
  }

  @override
  void update(void Function(AssessmentReportInitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssessmentReportInitial build() {
    final _$result =
        _$v ?? new _$AssessmentReportInitial._(assessment: assessment);
    replace(_$result);
    return _$result;
  }
}

class _$AssessmentReportLoading extends AssessmentReportLoading {
  @override
  final Assessment assessment;

  factory _$AssessmentReportLoading(
          [void Function(AssessmentReportLoadingBuilder) updates]) =>
      (new AssessmentReportLoadingBuilder()..update(updates)).build();

  _$AssessmentReportLoading._({this.assessment}) : super._();

  @override
  AssessmentReportLoading rebuild(
          void Function(AssessmentReportLoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssessmentReportLoadingBuilder toBuilder() =>
      new AssessmentReportLoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssessmentReportLoading && assessment == other.assessment;
  }

  @override
  int get hashCode {
    return $jf($jc(0, assessment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssessmentReportLoading')
          ..add('assessment', assessment))
        .toString();
  }
}

class AssessmentReportLoadingBuilder
    implements
        Builder<AssessmentReportLoading, AssessmentReportLoadingBuilder> {
  _$AssessmentReportLoading _$v;

  Assessment _assessment;
  Assessment get assessment => _$this._assessment;
  set assessment(Assessment assessment) => _$this._assessment = assessment;

  AssessmentReportLoadingBuilder();

  AssessmentReportLoadingBuilder get _$this {
    if (_$v != null) {
      _assessment = _$v.assessment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssessmentReportLoading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssessmentReportLoading;
  }

  @override
  void update(void Function(AssessmentReportLoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssessmentReportLoading build() {
    final _$result =
        _$v ?? new _$AssessmentReportLoading._(assessment: assessment);
    replace(_$result);
    return _$result;
  }
}

class _$AssessmentReportFileSuccess extends AssessmentReportFileSuccess {
  @override
  final Uint8List file;
  @override
  final String filename;
  @override
  final String fileMimeType;
  @override
  final Assessment assessment;

  factory _$AssessmentReportFileSuccess(
          [void Function(AssessmentReportFileSuccessBuilder) updates]) =>
      (new AssessmentReportFileSuccessBuilder()..update(updates)).build();

  _$AssessmentReportFileSuccess._(
      {this.file, this.filename, this.fileMimeType, this.assessment})
      : super._() {
    if (file == null) {
      throw new BuiltValueNullFieldError('AssessmentReportFileSuccess', 'file');
    }
    if (filename == null) {
      throw new BuiltValueNullFieldError(
          'AssessmentReportFileSuccess', 'filename');
    }
    if (fileMimeType == null) {
      throw new BuiltValueNullFieldError(
          'AssessmentReportFileSuccess', 'fileMimeType');
    }
  }

  @override
  AssessmentReportFileSuccess rebuild(
          void Function(AssessmentReportFileSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssessmentReportFileSuccessBuilder toBuilder() =>
      new AssessmentReportFileSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssessmentReportFileSuccess &&
        file == other.file &&
        filename == other.filename &&
        fileMimeType == other.fileMimeType &&
        assessment == other.assessment;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, file.hashCode), filename.hashCode),
            fileMimeType.hashCode),
        assessment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssessmentReportFileSuccess')
          ..add('file', file)
          ..add('filename', filename)
          ..add('fileMimeType', fileMimeType)
          ..add('assessment', assessment))
        .toString();
  }
}

class AssessmentReportFileSuccessBuilder
    implements
        Builder<AssessmentReportFileSuccess,
            AssessmentReportFileSuccessBuilder> {
  _$AssessmentReportFileSuccess _$v;

  Uint8List _file;
  Uint8List get file => _$this._file;
  set file(Uint8List file) => _$this._file = file;

  String _filename;
  String get filename => _$this._filename;
  set filename(String filename) => _$this._filename = filename;

  String _fileMimeType;
  String get fileMimeType => _$this._fileMimeType;
  set fileMimeType(String fileMimeType) => _$this._fileMimeType = fileMimeType;

  Assessment _assessment;
  Assessment get assessment => _$this._assessment;
  set assessment(Assessment assessment) => _$this._assessment = assessment;

  AssessmentReportFileSuccessBuilder();

  AssessmentReportFileSuccessBuilder get _$this {
    if (_$v != null) {
      _file = _$v.file;
      _filename = _$v.filename;
      _fileMimeType = _$v.fileMimeType;
      _assessment = _$v.assessment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssessmentReportFileSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssessmentReportFileSuccess;
  }

  @override
  void update(void Function(AssessmentReportFileSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssessmentReportFileSuccess build() {
    final _$result = _$v ??
        new _$AssessmentReportFileSuccess._(
            file: file,
            filename: filename,
            fileMimeType: fileMimeType,
            assessment: assessment);
    replace(_$result);
    return _$result;
  }
}

class _$AssessmentReportExportUrlSuccess
    extends AssessmentReportExportUrlSuccess {
  @override
  final String reportUrl;
  @override
  final Assessment assessment;

  factory _$AssessmentReportExportUrlSuccess(
          [void Function(AssessmentReportExportUrlSuccessBuilder) updates]) =>
      (new AssessmentReportExportUrlSuccessBuilder()..update(updates)).build();

  _$AssessmentReportExportUrlSuccess._({this.reportUrl, this.assessment})
      : super._() {
    if (reportUrl == null) {
      throw new BuiltValueNullFieldError(
          'AssessmentReportExportUrlSuccess', 'reportUrl');
    }
  }

  @override
  AssessmentReportExportUrlSuccess rebuild(
          void Function(AssessmentReportExportUrlSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AssessmentReportExportUrlSuccessBuilder toBuilder() =>
      new AssessmentReportExportUrlSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AssessmentReportExportUrlSuccess &&
        reportUrl == other.reportUrl &&
        assessment == other.assessment;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, reportUrl.hashCode), assessment.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AssessmentReportExportUrlSuccess')
          ..add('reportUrl', reportUrl)
          ..add('assessment', assessment))
        .toString();
  }
}

class AssessmentReportExportUrlSuccessBuilder
    implements
        Builder<AssessmentReportExportUrlSuccess,
            AssessmentReportExportUrlSuccessBuilder> {
  _$AssessmentReportExportUrlSuccess _$v;

  String _reportUrl;
  String get reportUrl => _$this._reportUrl;
  set reportUrl(String reportUrl) => _$this._reportUrl = reportUrl;

  Assessment _assessment;
  Assessment get assessment => _$this._assessment;
  set assessment(Assessment assessment) => _$this._assessment = assessment;

  AssessmentReportExportUrlSuccessBuilder();

  AssessmentReportExportUrlSuccessBuilder get _$this {
    if (_$v != null) {
      _reportUrl = _$v.reportUrl;
      _assessment = _$v.assessment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AssessmentReportExportUrlSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AssessmentReportExportUrlSuccess;
  }

  @override
  void update(void Function(AssessmentReportExportUrlSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AssessmentReportExportUrlSuccess build() {
    final _$result = _$v ??
        new _$AssessmentReportExportUrlSuccess._(
            reportUrl: reportUrl, assessment: assessment);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
