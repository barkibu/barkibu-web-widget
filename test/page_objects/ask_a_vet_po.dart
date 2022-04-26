import 'package:pageloader/html.dart';

part 'ask_a_vet_po.g.dart';

@PageObject()
@CheckTag('ask-a-vet')
abstract class AskAVetPO {
  AskAVetPO();
  factory AskAVetPO.create(PageLoaderElement context) = $AskAVetPO.create;
}
