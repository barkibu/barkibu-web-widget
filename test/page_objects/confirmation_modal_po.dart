import 'package:pageloader/html.dart';

part 'confirmation_modal_po.g.dart';

@PageObject()
@CheckTag('confirmation-modal')
abstract class ConfirmationModalPO {
  ConfirmationModalPO();
  factory ConfirmationModalPO.create(PageLoaderElement context) = $ConfirmationModalPO.create;

  @ById('modal_title')
  PageLoaderElement get _title;

  @ById('modal_description')
  PageLoaderElement get _description;

  @ByCss('button.confirm')
  PageLoaderElement get _confirm;

  @ByCss('button.cancel')
  PageLoaderElement get _cancel;

  String get title => _title.innerText;
  String get description => _description.innerText;
  void confirm() async => await _confirm.click();
  void cancel() async => await _cancel.click();
}
