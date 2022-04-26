import 'package:common_barkibu_dart/common_barkibu_dart.dart';

abstract class GetPetAssessmentReportUseCase {
  Future<Assessment> getPetAssessment(String consultationId);
  Future<AssessmentPDF> getPetAssessmentPDF(Pet pet, String consultationId);
  Future<String> getPetAssessmentPDFShortLivedUrl(Pet pet, String consultationId);
}

class GetPetAssessmentReportUseCaseImpl implements GetPetAssessmentReportUseCase {
  final PetRepository _petRepository;
  final AssessmentRepository _assessmentRepository;
  final TokenRepository _tokenRepository;

  GetPetAssessmentReportUseCaseImpl(this._petRepository, this._tokenRepository, this._assessmentRepository);

  @override
  Future<Assessment> getPetAssessment(String consultationId) {
    return _assessmentRepository.getAssessment(consultationId);
  }

  @override
  Future<AssessmentPDF> getPetAssessmentPDF(Pet pet, String consultationId) {
    return _petRepository.getAssessmentPDF(pet.id, consultationId);
  }

  @override
  Future<String> getPetAssessmentPDFShortLivedUrl(Pet pet, String consultationId) async {
    final token = await _tokenRepository.create();
    final baseUrl = ServiceLocator.container<Configuration>().backendUrl;
    final locale = ServiceLocator.container<LocaleService>().currentLocale;
    return '${baseUrl}/pets/${pet.id}/reports/${consultationId}?token=$token&locale=$locale';
  }
}
