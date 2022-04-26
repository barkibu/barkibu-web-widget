import 'dart:typed_data';

class AssessmentPDF {
  final Uint8List file;

  AssessmentPDF(this.file);

  @override
  bool operator ==(other) {
    return (identical(other, this)) || other is AssessmentPDF && other.file == file;
  }

  @override
  int get hashCode => file.hashCode;
}
