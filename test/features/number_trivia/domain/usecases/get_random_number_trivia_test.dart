import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MokeNumberTriviaRepository extends Mock
implements NumberTriviaRepository{

}

void main(){
  GetRandomNumberTrivia usecase;
  MokeNumberTriviaRepository mokeNumberTriviaRepository;

  setUp((){
    mokeNumberTriviaRepository = MokeNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mokeNumberTriviaRepository);   
  });
 
  final tNumberTrivia = NumberTrivia(text:'test', number: 1);
  
test('should get trivia from the repository', ()async {
  //arrange
  when(mokeNumberTriviaRepository.getRandomNumberTrivia())
  .thenAnswer((_)async => Right(tNumberTrivia));

  //act
  final result = await usecase(NoParams()  );


  //assert 
  expect(result,Right(tNumberTrivia));
  verify(mokeNumberTriviaRepository.getRandomNumberTrivia());
  verifyNoMoreInteractions(mokeNumberTriviaRepository);
});
  
} 