// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class AssessmentReportMessages {
	const AssessmentReportMessages();
	AskAVetMenuAssessmentReportMessages get askAVetMenu => AskAVetMenuAssessmentReportMessages(this);
	String get firstAid => "First aid";
	String get notUrgentBody => "I’ve not detected any urgent condition. If the symptoms persist or you are worried about {pet}’s state, I recommend to ask a vet.";
	String get export => "Export";
	String get askAVet => "Ask a vet";
	String get vetCheckRecommended => "Contact your veterinarian for advice";
	String get treatedAtHome => "It may resolve naturally, contact your veterinarian if the symptoms persist or worsen over time";
	String get summary => "Summary";
	String get possibleCauses => "Possible Causes";
	String get nextSteps => "Next Steps";
	String get predispositionFactors => "Predisposition factors";
	String get treatment => "Treatment";
	String get noConditionsTitle => "The Virtual Vet couldn’t narrow down the possibilities, but professional attention may be needed.";
	String get symptoms => "Symptoms";
	String get prevention => "Prevention";
	String get urgentBodyCondition => "Based on the symptoms you have highlighted I recommend that you get in touch with a Vet as there may be some urgent issues that need to be looked at for {pet}.";
	String get noConditionsBody => "We recommend speaking with your vet or, if you’d like to connect with our veterinary team now, click the Ask A Vet button.";
	String get mainSymptom => "Main Symptom";
	String get urgent => "Seek urgent veterinary attention";
	String get urgentTitle => "Immediate Vet Attention Recommended";
	String get diagnosis => "Diagnosis";
	String get urgentBodySymptom => "The symptoms described could be dangerous for {pet}, I recommend that you go urgently with {pet} to a veterinary clinic";
	String get askAVetTitle => "Ask A Vet Report";
	String get title => "Assessment Report";
}

class AskAVetMenuAssessmentReportMessages {
	final AssessmentReportMessages _parent;
	const AskAVetMenuAssessmentReportMessages(this._parent);
	String get callWithAVet => "Call a Vet now";
	String get title => "Get in touch with a vet";
	String get callHoursTip => "Mon to Thu 9 am to 4 pm and Fri 9 am to 2 pm (CET)";
	String get chatWithAVet => "Chat with a Vet now";
	String get subtitle => "Select an option to get in touch with one of our Veterinaries";
	String get emailTip => "Average response time less than 12h";
}

