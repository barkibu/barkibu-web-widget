// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'assessmentReportMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class AssessmentReportMessages_de extends AssessmentReportMessages {
	const AssessmentReportMessages_de();
	AskAVetMenuAssessmentReportMessages_de get askAVetMenu => AskAVetMenuAssessmentReportMessages_de(this);
	String get firstAid => "Erste Hilfe";
	String get notUrgentBody => "Ich habe keinen dringenden Zustand festgestellt. Wenn die Symptome weiterhin bestehen oder Sie sich Sorgen über den Zustand von {pet} machen, empfehle ich, einen Tierarzt zu fragen.";
	String get export => "Export";
	String get askAVet => "Fragen Sie einen Tierarzt";
	String get vetCheckRecommended => "Wenden Sie sich an Ihren Tierarzt";
	String get treatedAtHome => "Es kann sich auf natürliche Weise lösen. Wenden Sie sich an Ihren Tierarzt, wenn die Symptome im Laufe der Zeit anhalten oder sich verschlimmern";
	String get summary => "Zusammenfassung";
	String get possibleCauses => "Mögliche Ursachen";
	String get nextSteps => "Nächste Schritte";
	String get predispositionFactors => "Veranlagungsfaktoren";
	String get treatment => "Behandlung";
	String get noConditionsTitle => "Entschuldigung, ich konnte nicht den richtigen Rat finden";
	String get symptoms => "Symptome";
	String get prevention => "Verhütung";
	String get urgentBodyCondition => "Aufgrund der von Ihnen hervorgehobenen Symptome empfehle ich Ihnen, sich an einen Tierarzt zu wenden, da es einige dringende Probleme geben kann, die nach {pet} untersucht werden müssen.";
	String get noConditionsBody => "Einige der von Ihnen hervorgehobenen Symptome können möglicherweise gefährlich sein. Sie sollten sich so schnell wie möglich mit einem Tierarzt in Verbindung setzen.";
	String get mainSymptom => "Hauptsymptom";
	String get urgent => "Suchen Sie dringend einen Tierarzt auf";
	String get urgentTitle => "Sofortige Aufmerksamkeit des Tierarztes empfohlen";
	String get diagnosis => "Diagnose";
	String get urgentBodySymptom => "Die beschriebenen Symptome können für {pet} gefährlich sein. Ich empfehle, dass Sie dringend mit {pet} in eine Tierklinik gehen";
	String get askAVetTitle => "Fragen Sie einen Tierarztbericht";
	String get title => "Beurteilung";
}

class AskAVetMenuAssessmentReportMessages_de extends AskAVetMenuAssessmentReportMessages {
	final AssessmentReportMessages_de _parent;
	const AskAVetMenuAssessmentReportMessages_de(this._parent):super(_parent);
	String get callWithAVet => "Rufen Sie jetzt einen Tierarzt an";
	String get title => "Kontaktieren Sie einen Tierarzt";
	String get callHoursTip => "Mo bis FR 10 bis 22 Uhr und Sa 10 bis 20 Uhr ";
	String get chatWithAVet => "Chatten Sie jetzt mit einem Tierarzt";
	String get subtitle => "Wählen Sie eine Option, um mit einem unserer Tierärzte in Kontakt zu treten";
	String get emailTip => "Durchschnittliche Reaktionszeit weniger als 12 Stunden";
}

