// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'assessmentReportMessages.i18n.dart';

String get _languageCode => 'es';
String get _localeName => 'es';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class AssessmentReportMessages_es extends AssessmentReportMessages {
	const AssessmentReportMessages_es();
	AskAVetMenuAssessmentReportMessages_es get askAVetMenu => AskAVetMenuAssessmentReportMessages_es(this);
	String get firstAid => "Primeros auxilios";
	String get notUrgentBody => "No he detectado ningún resultado urgente, aún así, si los síntomas persisten o el estado de {pet} te parece preocupante, te recomiendo que consultes con un veterinario";
	String get export => "Exportar";
	String get askAVet => "Habla con un veterinario";
	String get vetCheckRecommended => "Contacta con tu veterinario";
	String get treatedAtHome => "Puede resolverse de manera natural, contacta con tu veterinario si los síntomas persisten o empeoran";
	String get summary => "Resumen";
	String get possibleCauses => "Posibles Causas";
	String get nextSteps => "Siguientes Pasos";
	String get predispositionFactors => "Factores de riesgo";
	String get treatment => "Tratamiento";
	String get noConditionsTitle => "Lo siento, no he podido encontrar un resultado apropiado";
	String get symptoms => "Síntomas";
	String get prevention => "Prevención";
	String get urgentBodyCondition => "Los posibles resultados contienen enfermedades consideradas urgentes, te recomiendo que acudas urgentemente con {pet} a una clínica veterinaria";
	String get noConditionsBody => "Algunos de los síntomas que describes pueden ser considerados urgentes, te recomiendo que acudas a un veterinario rápidamente";
	String get mainSymptom => "Síntoma principal";
	String get urgent => "Busca ayuda veterinaria urgente";
	String get urgentTitle => "Se requiere atención veterinaria urgente";
	String get diagnosis => "Diagnóstico";
	String get urgentBodySymptom => "Los síntomas descritos pueden ser peligrosos para {pet}, te recomiendo que acudas urgentemente con {pet} a una clínica veterinaria";
	String get askAVetTitle => "Ask A Vet Informe";
	String get title => "Informe de la Evaluación";
}

class AskAVetMenuAssessmentReportMessages_es extends AskAVetMenuAssessmentReportMessages {
	final AssessmentReportMessages_es _parent;
	const AskAVetMenuAssessmentReportMessages_es(this._parent):super(_parent);
	String get callWithAVet => "Llamar a un veterinario ahora";
	String get title => "Ponte en contacto con un veterinario";
	String get callHoursTip => "Lun a Jue 9 am a 4 pm y Vie 9 am a 2 pm (CET)";
	String get chatWithAVet => "Hablar con un veterinario ahora";
	String get subtitle => "Selecciona una opción para ponerte en contacto con uno de nuestros veterinarios";
	String get emailTip => "Tiempo medio de respuesta menor a 12h";
}

