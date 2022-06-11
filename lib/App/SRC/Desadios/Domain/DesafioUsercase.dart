import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/LocalServices/set_Clock.dart';

import 'package:testes_de_estudos/App/src/Desadios/Data/Repository/Desfio_Repository.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/error/Desfio_Expition.dart';

import 'Entitys/Desafio_Entity.dart';

abstract class DesafiosUsercaseContracte {
  Future<Either<DesafioExpition, String>> validarAndSaveDesafio(
      DesafioFrom from);
  Future<Either<DesafioExpition, Map<String, DesafioEntity>>>
      getMapListDesfios();
  Future<Either<DesafioExpition, String>> sortiarDesafio(
      {required List<DesafioEntity> listDesafio});
}

class DesafiosUsercase implements DesafiosUsercaseContracte {
  final DesafioRepositoyContract repository;
  DesafiosUsercase(this.repository);
  @override
  getMapListDesfios() async {
    var result = await repository.getMapListDesfios();
    return result.fold((l) => left(l), (r) => right(r));
  }

  @override
  validarAndSaveDesafio(DesafioFrom form) async {
    bool _isValido = true;
    String? _tituloError;
    String? _dataLimiteError;
    String? _listDeRegrasError;
    String? _tagError;
    String? _imageError;
    /*----------[validação do titulo]----------*/
    if (form.titulo.length < 5) {
      _tituloError = 'Titulo muito curto!';
      _isValido = false;
    } else if (form.titulo.length > 20) {
      _tituloError = 'Titulo muito longo!';
      _isValido = false;
    }
    /*----------[validação do tag]----------*/

    if (form.tag.isEmpty) {
      _tagError = 'Informe sua tag';
      _isValido = false;
    } else if (form.tag[0] != '#') {
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
    if (form.duration < 2 || form.duration > 7) {
      _dataLimiteError = 'Data invalida!';
      _isValido = false;
    }
    /*----------[validação da image]----------*/
    if (form.image == null) {
      _imageError = 'Selecione uma imagen!';
      _isValido = false;
    }
    /*----------[retorno]----------*/
    if (_isValido) {
      var result = await repository.saveDesafio(form);
      return result;
    }
    /*----------[retorno expition]----------*/
    return left(DesafioExpition(
      titulo: _tituloError,
      tag: _tagError,
      listDeRegras: _listDeRegrasError,
      duration: _dataLimiteError,
      url: _imageError,
    ));
  }

  @override
  sortiarDesafio({
    required List<DesafioEntity> listDesafio,
  }) async {
    //-------------->Cache
    List<DesafioEntity> valueListAtivo =
        listDesafio.where((element) => element.ativo).toList();
    List<DesafioEntity> valueListnoaAtivo =
        listDesafio.where((element) => !element.ativo).toList();
    //
    var db = FirebaseFirestore.instance.collection('Desafios');
    var index = Random().nextInt(valueListnoaAtivo.length);
    DesafioEntity desafio = valueListnoaAtivo[index];
    //-------------->Function

    await db.doc(desafio.tag.toUpperCase()).update({
      'ativo': true,
      'prozo': ClockRemainingTime.getFuturedata(
        addtime: Duration(
          days: desafio.duration,
        ),
      )
    });
    if (valueListAtivo.isNotEmpty) {
      await db.doc(valueListAtivo[0].tag.toUpperCase()).update({
        'ativo': false,
      });
    }
    return right('');
  }
}
