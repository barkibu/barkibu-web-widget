# How to custom messages

Every message in the [messages](~/domain/lib/messages) package can be overridden using the MessageModelFactory.

## Add MessageFactory for custom messages

Create a class that extends the dart messages file wanted to override them.

```dart
class MessageModelCustom extends MessagesModel {
  MessageModelCustom()
          : super(
              PetProfileMessages_Custom()
              );
}

class PetProfileMessages_Custom extends PetProfileMessages {
    @override
    String get title => 'Overriden title';
}
```

## Specify in which case to use the factory

In the [message_model_factory](lib/messages/messages_model_factory.dart) file, add the wanted condition required to use the overridden messages.

Update the configuration flag `useSpecialTranslations` to specify the customization you want to use.

```dart
MessagesModel clientMessagesFactory(WidgetConfiguration config) {
  if (config.useSpecialTranslations == 'custom') {
    return MessagesModelCustom();
  } else {
    return null; // Default will be used
  }
}
```
