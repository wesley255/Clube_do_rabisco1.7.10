import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';

import '../../Domain/error/Desfio_Expition.dart';

abstract class DesafioDataSourceContract {
  Future<Either<DesafioExpition, String>> saveDesafio(DesafioFrom from);
  Future<Either<DesafioExpition, Map<String, DesafioEntity>>>
      getMapListDesfios();
}
