import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MokeNumberTriviaRepository extends Mock
implements NumberTriviaRepository{

}

void main(){
  GetConcreteNumberTrivia usecase;
  MokeNumberTriviaRepository mokeNumberTriviaRepository;

  setUp((){
    mokeNumberTriviaRepository = MokeNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mokeNumberTriviaRepository);   
  });

  final tNumber =1;
  final tNumberTrivia = NumberTrivia(text:'test', number: 1);
  
test('should get trivia for the number  from the repository', ()async {
  //arrange
  when(mokeNumberTriviaRepository.getConcreteNumberTrivia(any))
  .thenAnswer((_)async => Right(tNumberTrivia));

  //act
  final result = await usecase(Params(number: tNumber));


  //assert 
  expect(result,Right(tNumberTrivia));
  verify(mokeNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
  verifyNoMoreInteractions(mokeNumberTriviaRepository);
});
  
}