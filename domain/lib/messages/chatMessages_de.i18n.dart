// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;
import 'chatMessages.i18n.dart';

String get _languageCode => 'de';
String get _localeName => 'de';

String _plural(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.plural(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _ordinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.ordinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);
String _cardinal(int count, {String zero, String one, String two, String few, String many, String other}) =>
	i18n.cardinal(count, _languageCode, zero:zero, one:one, two:two, few:few, many:many, other:other);

class ChatMessages_de extends ChatMessages {
	const ChatMessages_de();
	BotMessagesChatMessages_de get botMessages => BotMessagesChatMessages_de(this);
	SymptomFrequencyChatMessages_de get symptomFrequency => SymptomFrequencyChatMessages_de(this);
	ChatWithVetChatMessages_de get chatWithVet => ChatWithVetChatMessages_de(this);
	HelperTextsChatMessages_de get helperTexts => HelperTextsChatMessages_de(this);
	String popupChatMessageSubtitle(String petName) => "";
	SymptomDurationChatMessages_de get symptomDuration => SymptomDurationChatMessages_de(this);
	String get petNameInputHint => "Geben Sie hier den Namen Ihres Haustieres ein";
	String get petBreedInputHint => "Geben Sie hier die Rasse Ihres Haustieres ein";
	String get you => "Sie";
	String get knowMore => "Mehr wissen";
	String get symptomInputHint => "Geben Sie hier das Hauptsymptom Ihres Haustieres ein";
	String get popupChatMessageTitle => "";
	String get openReport => "Bericht öffnen";
	String get title => "Neue Bewertung";
	String get chipSkipPrimarySymptom => "Überspringen: Verbinde mich jetzt stattdessen mit einem Tierarzt";
	String get chatMessageInputHint => "Schreiben Sie ihre Nachricht hier";
}

class BotMessagesChatMessages_de extends BotMessagesChatMessages {
	final ChatMessages_de _parent;
	const BotMessagesChatMessages_de(this._parent):super(_parent);
	String get symptomDurationQuestion => "<b>Wie lange</b> besteht dieses Symptom schon?";
	String get symptomConfirmation => "Ist das korrekt?";
	String get anamnesisEmptyAnotherOption => "Oder Sie können <b>die Fragen erneut beantworten</b>, um uns zu helfen, Ihnen den besten Rat zu geben. Das Hinzufügen weiterer Details oder das Umformulieren kann manchmal hilfreich sein.";
	String askPetCastrated(String petName) => "Ist <b>$petName</b> kastriert?";
	String get addPet => "Fügen Sie ein Haustier hinzu";
	String askSymptomConfirmation(String petName) => "OK. Tritt bei <b>$petName</b> eines dieser Symptome auf?";
	String urgentBody(String petName) => "Hmmm, ich mache mir ein wenig Sorgen um $petName, basierend auf den von Ihnen hervorgehobenen Symptomen. Wir empfehlen, dass Sie sich an einen Tierarzt wenden, da es einige dringende Probleme geben kann, die für $petName geprüft werden müssen";
	String askSymptomQuestion(String petName) => "Was ist das <b>primäre Symptom</b>, bei dem $petName auftritt?";
	String addMoreSymptoms(String petName) => "Hat $petName <b>andere Symptome</b>, die Sie hinzufügen möchten?";
	String selectSex(String petName) => "Ist $petName ein <b>er</b> oder <b>sie</b>?";
	String selectAgeRange(String petName) => "Wie alt ist <b>$petName</b>?";
	String assessmentProfileReminder(String petName) => "Denken Sie daran, dass Sie jederzeit zum Profil von $petName zurückkehren können, um den Bewertungsbericht erneut zu überprüfen";
	String get askPetBreed => "Was ist die <b>Rasse</b> Ihres Haustieres?";
	String get symptomHasError => "Beim Versuch, das Symptom zu verstehen, ist ein Fehler aufgetreten. Könnten Sie es noch einmal wiederholen?";
	String get assessmentReadyNoMoreQuestions => "";
	String selectSpecies(String petName) => "Ist $petName ein <b>Hund</b> oder eine <b>Katze</b>?";
	String get initBot => "Ich werde Ihnen helfen, herauszufinden, was passiert";
	String withRelatedSymptoms(String petName, String relatedSymptoms) => "$petName hat auch: <b>$relatedSymptoms</b>";
	String get changePhoneNumber => "Können Sie uns sagen, mit welcher Telefonnummer wir Kontakt aufnehmen sollen?";
	String get anamnesisEmptyProposal => "Wenn Sie möchten, können Sie jetzt klicken, um <b>mit einem Tierarzt zu sprechen</b>.";
	String get feedbackNotOk => "<b>Tut mir leid das zu hören.</b>";
	String get anamnesisResultCondition => "Ich habs! Im Folgenden sind einige <b>mögliche Probleme</b> aufgeführt, die mit den von Ihnen angegebenen Symptomen übereinstimmen. Klicken Sie auf jeden von ihnen, um mehr zu erfahren und mit einem Tierarzt zu sprechen.";
	String get assessmentFinished => "Alles erledigt! Ich habe einen Bericht zusammengestellt, in dem mögliche Ursachen für diese Symptome aufgeführt sind";
	String get showResultsAction => "Mehr erfahren";
	String get urgent => "Sofortige Aufmerksamkeit des Tierarztes empfohlen";
	String askOtherSymptomQuestion(String petName) => "Welches <b>andere Symptom</b> hat $petName?";
	String get noPetsProfile => "Oh, before we start here, we need to add a Pet to your profile so we can know a bit about them to be able to help.\nGo <b>Add a Pet</b> to your account and then come back and we can continue.";
	String get anamnesisResultWarning => "Denken Sie daran, dass <b>diese Ergebnisse nicht dazu gedacht sind, professionelle tierärztliche Beratung, Diagnose oder Behandlung zu ersetzen.</b>";
	String get optionBackHomeTitle => "Wieder nach Hause gehen";
	String askSymptomStart(String petName) => "Starten wir die <b>Symptomprüfung</b>.";
	String get anamnesisEmptyUrgent => "Hmmm ... ich kann nicht den richtigen Rat finden. Ich bin noch nicht so intelligent, aber ich bin sicher, dass einige der von Ihnen eingeführten Symptome potenziell gefährlich sind. Sie sollten sich so schnell wie möglich mit einem Tierarzt in Verbindung setzen.";
	String checkPhoneNumber(String phoneNumber) => "Okay, wir werden uns per Telefonanruf bei Ihnen melden. Können Sie bestätigen, dass <b>$phoneNumber</b> Ihre aktuelle Telefonnummer ist?";
	String get selectPet => "Über welches <b>Haustier</b> möchten Sie sprechen?";
	String get anamnesisResultSymptom => "Hmmm ... ich kann nicht den richtigen Rat finden. Ich bin noch nicht so intelligent, aber hier haben Sie einige nützliche Informationen.";
	String get assessmentReady => "";
	String anamnesisEmptyNotUrgent(String petName) => "Es tut mir leid, aber ich bin mir nicht sicher, welche Probleme $petName haben könnte. Ich lerne jeden Tag neue Dinge, aber im Moment ist mein einziger Rat, der auf dem basiert, was Sie geteilt haben, dass Sie sich wahrscheinlich an einen Tierarzt wenden sollten.";
	String get labelPhoneNumber => "Gib deine Handynummer ein";
	String get changePhoneNumberSuccess => "Okay, planen wir einen Anruf.";
	String get optionPersonalRecommendationsTitle => "Sehen Sie sich Ihre persönlichen Empfehlungen an";
	String get symptomIsEmpty => "Entschuldigung, ich verstehe das Symptom nicht. Könnten Sie es anders schreiben?";
	String get changePhoneNumberError => "Leider konnten wir Ihre Telefonnummer nicht aktualisieren.";
	String get assessmentAdvise => "Vergessen Sie nicht, dass dies <b>keine medizinische Diagnose</b> ist. Im Zweifelsfall ist es immer am besten, sich von einem Tierarzt beraten zu lassen";
	String get nextHelpQuestion => "Womit kann ich Ihnen als nächstes helfen?";
	String get channelChoice => "OK, wie möchten Sie, dass wir Sie kontaktieren?";
	String withoutRelatedSymptoms(String petName) => "$petName hat <b>keine</b> anderen Symptome";
	String relatedSymptomsQuestion(String petName) => "Ich habs. Hat $petName auch <b>eines dieser Symptome</b>?";
	String get assessmentReadyInProgress => "";
	String get optionTalkWithAVetTitle => "Sprechen Sie mit einem Tierarzt";
	String get nextQuestionBackendIssue => "Leider haben wir interne Probleme und können den Vorgang nicht fortsetzen. Wir sind uns des Problems bewusst und arbeiten hart daran, es zu beheben. Sie können es nach einigen Minuten erneut versuchen und prüfen, ob das Problem behoben ist.";
	String get feedbackOk => "<b>Großartig!</b> Kommen Sie jedes Mal zurück, wenn Sie eine Frage zu <b>Ihrem Haustier haben.</b>";
	String askPetSpayed(String petName) => "Wird <b>$petName</b> kastriert?";
	String symptomFound(String symptom) => "Ich habs. Das Symptom ist <b>$symptom</b>";
	String get optionAskAnotherQuestionTitle => "Stellen Sie eine andere Frage";
	String get symptomIncorrect => "Könnten Sie es noch einmal schreiben?";
	String askSymptomQuestionWithSpecie(String species) => "Ok, können Sie ein Wort, eine Phrase oder eine Frage eingeben, damit ich das Hauptsymptom verstehen kann, das Ihre <b>$species</b> hat?";
	String get symptomFrequencyQuestion => "<b>Wie oft</b> ist es passiert?";
	String get askPetName => "Wie heißt Ihr Haustier <b>Name</b>?";
	String get optionGoBackTitle => "Geh zurück";
	String get askFeedback => "War meine Antwort <b>hilfreich</b>?";
	String get emptyPhoneNumber => "Ok, anscheinend haben wir keine Telefonnummer, um mit Ihnen in Kontakt zu treten. Geben Sie Ihre Telefonnummer ein, damit wir einen Anruf planen können.";
}

class SymptomFrequencyChatMessages_de extends SymptomFrequencyChatMessages {
	final ChatMessages_de _parent;
	const SymptomFrequencyChatMessages_de(this._parent):super(_parent);
	String get medium => "2 bis 5 mal pro Tag";
	String get high => "6 oder mehr Mal pro Tag";
	String get low => "einmal oder weniger pro Tag";
}

class ChatWithVetChatMessages_de extends ChatWithVetChatMessages {
	final ChatMessages_de _parent;
	const ChatWithVetChatMessages_de(this._parent):super(_parent);
	VideoSharingChatWithVetChatMessages_de get videoSharing => VideoSharingChatWithVetChatMessages_de(this);
	RecoverChatChatWithVetChatMessages_de get recoverChat => RecoverChatChatWithVetChatMessages_de(this);
	String get letsConnectChat => "Ok, lassen Sie sich jetzt <b>mit einem Tierarzt verbinden ...";
	String vetChatTriagePet(String petName, String gender, String species, String breed, bool neutered, bool mixedBreed, String size) => "Kosename: $petName\nGender: $gender\nSpezies: $species\nZucht: $breed\nKastriert: $neutered\nGemischte Rasse: $mixedBreed\nGröße: $size";
	String vetChatTriageSymptom(String mainSymptom, String duration) => "Hauptsymptom: $mainSymptom\nDauer: $duration";
	String get positiveFeedback => "<b>Großartig!</b> Kommen Sie jedes Mal zurück, wenn Sie eine Frage zu <b>Ihrem Haustier haben.</b>";
	String vetChatTriageAllSymptoms(String mainSymptom, String duration, String relatedSymptoms, String possibleDiseases) => "Hauptsymptom: $mainSymptom\nDauer: $duration\nVerwandte Symptome: $relatedSymptoms\nMögliche Krankheiten: $possibleDiseases";
	String get closedChat => "Der Tierarzt hat <b>den Chat geschlossen.</b>";
	String letsConnectVideoOrPhone(String brandName, String channel) => "Sie werden nun zum Terminkalender von $brandName weitergeleitet, um Ihren <b>$channel</b> -Anruf zu planen.";
	String vetChatTriageSpecies(String species) => "Spezies: $species";
	String get title => "Fragen Sie einen Tierarzt";
	String get petParentLeftChat => "Der Haustierelternteil <b>ist abstentent.</b>";
	String get videoChatUnavailable => "Video-Chat ist derzeit nicht verfügbar 😱";
	String vetChatTriagePartner(String partner) => "Partner: $partner";
	String get errorConnectionToAVet => "Entschuldigung, es gab ein <b>Problem</b> bei der Verbindung mit einem Tierarzt.";
	String get noVetsAvailable => "Leider sind derzeit keine <b>Tierärzte</b> verfügbar. Ihre Öffnungszeiten sind Montag bis Donnerstag von 9:00 bis 16:00 Uhr und Freitag von 9:00 bis 14:00 Uhr ohne Unterbrechung. Innerhalb dieser Stunden können Sie versuchen, sie in wenigen Minuten erneut zu kontaktieren. Sie können ihnen auch eine E-Mail senden oder einen Anruf planen.";
	String videoIsNotAvailable(String brandName) => "Video-Chat kommt bald. Bitte wählen Sie einen anderen Weg, um sich mit den $brandName -Tierärzten zu verbinden.";
	String get initVet => "Wir werden Sie gleich mit einem Tierarzt verbinden, aber zuerst haben wir ein paar kurze Fragen, um unserem Team zu helfen, Ihnen die beste Anleitung zu geben.";
	String get findingAVet => "Groß. Warten Sie einige Sekunden, während <b>ich einen Tierarzt finde.</b>";
	String vetJoined(String identity) => "Sie sind mit $identity vom Vet Team verbunden";
	String letsConnectEmail(String brandName) => "Wir werden die E-Mail für Sie starten, aber bitte fügen Sie so viele Informationen wie möglich hinzu, damit das $brandName -Team Ihnen die beste Anleitung gibt. Klicken Sie auf <b>OK</b>, um zu beginnen.";
	String get letsConnectVideoOrPhoneInformation => "Nachdem Sie Ihren Termin festgelegt haben, tippen Sie auf die Schaltfläche \"Fertig\" oder \"Zurück\", um zu diesem Bildschirm zurückzukehren.";
	String get negativeFeedback => "<b>Tut mir leid, das zu hören.</b> Ihr Feedback wird uns helfen, uns zu verbessern.";
	String get askFeedback => "War Ihr Chat mit dem Tierarzt hilfreich?";
	String get petParentLeftPermanently => "Der Haustierelternteil hat den Chat definitiv verlassen";
	String get connectedToAVet => "Ok, Sie sind jetzt <b>verbunden</b>.";
	String userIsTyping(String user) => "$user tippt";
}

class VideoSharingChatWithVetChatMessages_de extends VideoSharingChatWithVetChatMessages {
	final ChatWithVetChatMessages_de _parent;
	const VideoSharingChatWithVetChatMessages_de(this._parent):super(_parent);
	String get closedByPetParent => "Pet Parent hat das Video Stream Sharing geschlossen";
	String get terminateSuccess => "Der Video-Chat ist jetzt deaktiviert. Klicken Sie auf Zurück, um zum Tippen mit dem Tierarzt zurückzukehren";
	String vetJoined(String vet) => "$vet trat dem Video-Beratungsraum bei";
	PermissionsVideoSharingChatWithVetChatMessages_de get permissions => PermissionsVideoSharingChatWithVetChatMessages_de(this);
	String get roomRequestSuccess => "Video-Beratungsraum erfolgreich erstellt";
	String get callRequestSuccess => "Anruf erfolgreich aufgebaut";
	String get callRequestFailure => "Die Videoverbindung wurde abgelehnt";
	String get endCall => "Anruf beenden";
	String get callRequestInProgress => "Verbindung mit dem Tierarzt";
	String loading(String vet) => "Ich rufe $vet an";
	String get switchCamera => "Kamera wechseln";
	String get startButton => "Starten Sie die Freigabe von Videostreams";
	String get roomRequestFailure => "Bei der Vorbereitung des Video-Beratungsraums ist etwas Unerwartetes passiert 🤯. Bitte versuche es erneut!";
	String get roomRequestInProgress => "Vorbereiten eines Video-Beratungsraums";
	String get errorTitle => "Hoppla";
	String get streamSharingFailure => "Beim Versuch, den Videostream zu teilen, ist ein Fehler aufgetreten. Bitte versuchen Sie es erneut";
}

class PermissionsVideoSharingChatWithVetChatMessages_de extends PermissionsVideoSharingChatWithVetChatMessages {
	final VideoSharingChatWithVetChatMessages_de _parent;
	const PermissionsVideoSharingChatWithVetChatMessages_de(this._parent):super(_parent);
	String get body => "Für diese Funktion muss die Videofunktion aktiviert sein";
	String get warning => "Die App wird möglicherweise neu gestartet. Sie können den Chat fortsetzen";
	String get title => "Video-Sharing-Funktion";
}

class RecoverChatChatWithVetChatMessages_de extends RecoverChatChatWithVetChatMessages {
	final ChatWithVetChatMessages_de _parent;
	const RecoverChatChatWithVetChatMessages_de(this._parent):super(_parent);
	String get yes => "Ja, weiter";
	String get detail => "Sie waren mitten in einem Gespräch mit einem Tierarzt. Möchten Sie fortfahren?";
	String get title => "Setzen Sie den vorherigen Chat fort";
	String get no => "Nein";
}

class HelperTextsChatMessages_de extends HelperTextsChatMessages {
	final ChatMessages_de _parent;
	const HelperTextsChatMessages_de(this._parent):super(_parent);
	String get doubleTapToSelect => "Tippen Sie zur Auswahl zweimal auf";
	String get petParentSays => "Ich sage:";
	String botSays(String botName) => "$botName sagt:";
}

class SymptomDurationChatMessages_de extends SymptomDurationChatMessages {
	final ChatMessages_de _parent;
	const SymptomDurationChatMessages_de(this._parent):super(_parent);
	String get short => "weniger als 1 Tag";
	String get long => "4 Tage oder länger";
	String get medium => "1-3 Tage";
}

