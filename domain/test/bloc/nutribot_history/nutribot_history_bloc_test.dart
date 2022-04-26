import 'package:common_barkibu_dart/bloc/nutribot_history/nutribot_history.dart';
import 'package:common_barkibu_dart/domain/pet/nutribot_history_use_case.dart';
import 'package:common_barkibu_dart/models/pet.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockGetNutribotHistoryUseCase extends Mock implements NutribotHistoryUseCase {}

void main() {
  NutribotHistoryUseCase nutribotHistoryUseCase;
  NutribotHistoryBloc nutribotHistoryBloc;

  final pet = Pet(id: 1);

  setUp(() {
    nutribotHistoryUseCase = MockGetNutribotHistoryUseCase();
    nutribotHistoryBloc = NutribotHistoryBloc(nutribotHistoryUseCase);
    when(nutribotHistoryUseCase.getNutribotConsultations(any)).thenAnswer((_) => Future.value([]));
  });

  tearDown(() async {
    await nutribotHistoryBloc?.close();
  });

  group('NutribotHistoryBloc', () {
    test('initial state is correct', () {
      expect(nutribotHistoryBloc.initialState, isA<NutribotHistoryInitial>());
    });

    group('NutribotHistoryRequested event', () {
      final startedEvent = NutribotHistoryRequested(pet.id);

      group('Successful', () {
        setUp(() {
          when(nutribotHistoryUseCase.getNutribotConsultations(pet.id)).thenAnswer((_) => Future.value([]));
        });
        test('it yields NutribotHistoryLoadSuccess state with the new pet', () {
          expectLater(
            nutribotHistoryBloc,
            emitsInOrder([
              isA<NutribotHistoryInitial>(),
              isA<NutribotHistoryLoadInProgress>(),
              isA<NutribotHistoryLoadSuccess>(),
            ]),
          );
          nutribotHistoryBloc.add(startedEvent);
        });
      });

      group('Failing', () {
        setUp(() {
          when(nutribotHistoryUseCase.getNutribotConsultations(any)).thenAnswer((_) => throw Error());
        });
        test('it yields NutribotHistoryLoadFailure state without pet if request fails', () {
          expectLater(
            nutribotHistoryBloc,
            emitsInOrder([
              isA<NutribotHistoryInitial>(),
              isA<NutribotHistoryLoadInProgress>(),
              isA<NutribotHistoryLoadFailure>(),
            ]),
          );
          nutribotHistoryBloc.add(startedEvent);
        });
      });
    });
  });
}
