import 'package:common_barkibu_dart/models/faq.dart';

class FaqState {}

class FaqLoadSuccess extends FaqState {
  final List<Faq> faqs;

  FaqLoadSuccess(this.faqs);
}
