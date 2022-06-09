import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/LocalServices/Create_ID.dart';
import 'package:testes_de_estudos/App/SRC/Desadios/Domain/error/Desfio_Expition.dart';

import 'Entitys/Desafio_Entity.dart';

abstract class DesafiosUsercaseContracte {
  Future<Either<DesafioExpition, String>> validarAndSaveDesafio(
      DesafioFrom from);
  Future<Either<DesafioExpition, String>> getMapListDesfios();
}

class DesafiosUsercase implements DesafiosUsercaseContracte {
  @override
  getMapListDesfios() async {
    throw UnimplementedError();
  }

  @override
  validarAndSaveDesafio(DesafioFrom form) async {
    bool _isValido = true;
    String? _tituloError;
    String? _dataLimiteError;
    String? _listDeRegrasError;
    String? _tagError;
    /*----------[validação do titulo]----------*/
    if (form.titulo.length < 5) {
      _tituloError = 'Titulo muito curto!';
      _isValido = false;
    } else if (form.titulo.length > 20) {
      _tituloError = 'Titulo muito longo!';
      _isValido = false;
    }
    /*----------[validação do tag]----------*/
    if (form.tag[0] != '#') {
      _tagError = 'tag em formato invalido, A tag deve começar com #';
      _isValido = false;
    } else if (form.tag.length < 4) {
      _tagError = 'tag muito curta!';
      _isValido = false;
    }
    /*----------[validação do regras]----------*/
    if (form.listDeRegras.isEmpty) {
      _listDeRegrasError = 'O desafio deve ter pelo menus uma regra';
      _isValido = false;
    } else if (form.listDeRegras.length < 5) {
      _listDeRegrasError = 'tamanho da regra e muito curta!';
      _isValido = false;
    }
    /*----------[validação do tempo]----------*/
    if (DateTime.now().day >= form.dataLimite.day) {
      _dataLimiteError = 'Data invalida!';
      _isValido = false;
    }
    /*----------[retorno]----------*/
    if (_isValido) {
      return right(criateID());
    }
    /*----------[retorno expition]----------*/
    return left(DesafioExpition(
        titulo: _tituloError,
        tag: _tagError,
        listDeRegras: _listDeRegrasError,
        dataLimite: _dataLimiteError));
  }
}
