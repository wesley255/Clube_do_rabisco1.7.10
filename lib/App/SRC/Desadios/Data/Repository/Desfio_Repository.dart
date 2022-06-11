import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/src/Desadios/Data/Data_souce/Desafio_DataSouce.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/error/Desfio_Expition.dart';

import '../../Domain/Entitys/Desafio_Entity.dart';

abstract class DesafioRepositoyContract {
  Future<Either<DesafioExpition, String>> saveDesafio(DesafioFrom from);
  Future<Either<DesafioExpition, Map<String, DesafioEntity>>>
      getMapListDesfios();
}

class DesafioRepositoy implements DesafioRepositoyContract {
  DesafioDataSourceContract externo;
  DesafioRepositoy(this.externo);
  @override
  getMapListDesfios() async {
    return await externo.getMapListDesfios();
  }

  @override
  saveDesafio(DesafioFrom from) async {
    var result = await externo.saveDesafio(from);
    return result;
  }
}
