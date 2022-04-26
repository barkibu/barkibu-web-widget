import 'package:common_barkibu_dart/bloc/autocomplete/autocomplete.dart';
import 'package:common_barkibu_dart/domain/pet/get_breeds_use_case.dart';
import 'package:common_barkibu_dart/models/breed.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockAutoCompletionUseCase extends Mock implements AutoCompletionUseCase {}

void main() {
  AutoCompleteBloc autoCompleteBloc;
  AutoCompletionUseCase autoCompletionUseCase;

  setUp(() {
    autoCompletionUseCase = MockAutoCompletionUseCase();
    autoCompleteBloc = AutoCompleteBloc(autoCompletionUseCase);
  });

  tearDown(() async {
    await autoCompleteBloc?.close();
  });

  group('AutoCompleteBloc', () {
    test('AutoCompletionUseCase triggered retrive a list of breeds succesfully', () async {
      when(autoCompletionUseCase.search(any, any))
          .thenAnswer((_) => Future.value([Breed(name: 'Pug', breedUuid: '1111', key: 'pug')]));
      autoCompleteBloc.add(AutoCompleteRequested((b) => b
        ..query = 'Pug'
        ..params = {'species': 'dog', 'locale': 'en'}));
      await autoCompleteBloc.close();
      verify(autoCompletionUseCase.search(any, any));
      await expectLater(
          autoCompleteBloc,
          emitsInOrder([
            isA<AutoCompleteLoadSuccess>(),
          ]));
    });
    test('AutoCompletionUseCase triggered fails to retrive a list of breeds', () async {
      when(autoCompletionUseCase.search(any, any)).thenAnswer((_) => Future.value([]));
      autoCompleteBloc.add(AutoCompleteRequested((b) => b
        ..query = 'Pug'
        ..params = {'species': 'dog', 'locale': 'en'}));
      await autoCompleteBloc.close();
      verify(autoCompletionUseCase.search(any, any));
      await expectLater(
          autoCompleteBloc,
          emitsInOrder([
            isA<AutoCompleteLoadFailure>(),
          ]));
    });
  });
}
