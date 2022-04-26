import 'package:pageloader/html.dart';

part 'chat_controls_po.g.dart';

@PageObject()
@CheckTag('chat-controls')
abstract class ChatControlsPO {
  ChatControlsPO();
  factory ChatControlsPO.create(PageLoaderElement context) = $ChatControlsPO.create;
  factory ChatControlsPO.lookup(PageLoaderSource context) = $ChatControlsPO.lookup;

  @ByTagName('chat-select li button')
  List<PageLoaderElement> get _selectOptions;

  @ByTagName('chat-multiple-select li label')
  List<PageLoaderElement> get _multiSelectOptions;

  @ByTagName('chat-multiple-select widget-button')
  PageLoaderElement get _multiSelectSubmit;

  @ByTagName('chat-yes-no li button')
  List<PageLoaderElement> get _yesNoOptions;

  @ByTagName('chat-buttons-input widget-button')
  List<PageLoaderElement> get _chatButtons;

  @ByTagName('chat-button-input widget-button')
  List<PageLoaderElement> get _chatActionButtons;

  @ByCss('chat-text-input input[type="text"]')
  PageLoaderElement get _textInput;

  @ByCss('chat-text-input button[type="submit"]')
  PageLoaderElement get _textInputSubmit;

  @ByCss('chat-phone-input input.prefix')
  PageLoaderElement get _phonePrefixInput;

  @ByCss('chat-phone-input input.phone')
  PageLoaderElement get _phoneInput;

  @ByCss('chat-phone-input button[type="submit"]')
  PageLoaderElement get _phoneInputSubmit;

  @ByCss('chat-age-input #months')
  PageLoaderElement get _months;

  @ByCss('chat-age-input #years')
  PageLoaderElement get _years;

  @ByCss('chat-age-input button[type="submit"]')
  PageLoaderElement get _ageSubmit;

  void selectOption(String label) async {
    await _selectOptions.firstWhere((option) => option.innerText == label).click();
  }

  void selectYesNoOption(String label) async {
    await _yesNoOptions.firstWhere((option) => option.innerText == label).click();
  }

  void clickChatButton(String label) async {
    await _chatButtons.firstWhere((option) => option.innerText == label).click();
  }

  void clickActionButton(String label) async {
    await _chatActionButtons.firstWhere((option) => option.innerText == label).click();
  }

  void selectMultipleOptions(List<String> options) async {
    await Future.forEach(_multiSelectOptions, (option) {
      if (options.contains(option.innerText)) {
        return option.click();
      }
    });
  }

  void submitSelectedOptions() async {
    await _multiSelectSubmit.click();
  }

  void enterAge(int years, int months) async {
    await _years.type(years.toString());
    await _months.type(months.toString());
  }

  void submitAge() async {
    await _ageSubmit.click();
  }

  List<String> listSelectOptions() {
    return _selectOptions.map((option) => option.innerText).toList();
  }

  void enterText(String text) async {
    await _textInput.type(text);
    await _textInputSubmit.click();
  }

  void enterPhoneNumber(String phone) async {
    await _phoneInput.type(phone);
  }

  void enterPhonePrefix(String prefix) async {
    await _phonePrefixInput.type(prefix);
  }

  void submitPhone() async {
    await _phoneInputSubmit.click();
  }
}
