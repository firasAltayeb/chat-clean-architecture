import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

//Params future proofs this class incase we need to e.g. print passed argumnets

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
