import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testes_de_estudos/App/src/Desadios/Data/Repository/Desfio_Repository.dart';

import 'package:testes_de_estudos/App/src/Desadios/Domain/DesafioUsercase.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/error/Desfio_Expition.dart';

class MockDesafioRepository implements DesafioRepositoyContract {
  @override
  Future<Either<DesafioExpition, Map<String, DesafioEntity>>>
      getMapListDesfios() {
    throw Exception();
  }

  @override
  saveDesafio(DesafioFrom from) async {
    return right('r');
  }
}

var mockDesafioRepository = MockDesafioRepository();

DesafiosUsercaseContracte desafioUsercasemock =
    DesafiosUsercase(mockDesafioRepository);
void main() {
  test('Validado com sucesso', () async {
    var resut = await desafioUsercasemock.validarAndSaveDesafio(_fromCerto);
    expect(resut.isRight(), true);
  });
  test('titulo curto', () async {
    var resut =
        await desafioUsercasemock.validarAndSaveDesafio(_fromtitulocurto);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).titulo,
        'Titulo muito curto!');
  });
  test('titulo muito longo', () async {
    var resut =
        await desafioUsercasemock.validarAndSaveDesafio(_fromtitulomuitoLongo);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).titulo,
        'Titulo muito longo!');
  });
  test('tag muito curta', () async {
    var resut = await desafioUsercasemock.validarAndSaveDesafio(_fromtagcurta);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).tag,
        'tag muito curta!');
  });
  test('tag invalida', () async {
    var resut =
        await desafioUsercasemock.validarAndSaveDesafio(_fromtaginvalida);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).tag,
        'tag em formato invalido, A tag deve começar com #');
  });
  test('lista de regra vasia', () async {
    var resut = await desafioUsercasemock
        .validarAndSaveDesafio(_fromListaDeRegrasVasia);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).listDeRegras,
        'O desafio deve ter pelo menus uma regra');
  });
  test('regra curta', () async {
    var resut = await desafioUsercasemock
        .validarAndSaveDesafio(_fromListaDeRegrascurta);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).listDeRegras,
        'tamanho da regra e muito curta!');
  });
  test('duraçao muito longa', () async {
    var resut = await desafioUsercasemock.validarAndSaveDesafio(_fromdatalonga);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).duration,
        'Data invalida!');
  });
  test('duraçao muito curta', () async {
    var resut = await desafioUsercasemock.validarAndSaveDesafio(_fromdatacurta);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).duration,
        'Data invalida!');
  });
}

DesafioFrom _fromCerto = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 4,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromtitulocurto = DesafioFrom(
    image: File('imagemock'),
    titulo: '"ti"',
    tag: '#tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromtitulomuitoLongo = DesafioFrom(
    image: File('imagemock'),
    titulo: '"12345678912450554463547851454"',
    tag: '#tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromtaginvalida = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: 'tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromtagcurta = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#gs',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromListaDeRegrasVasia = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#gs',
    listDeRegras: '',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromListaDeRegrascurta = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#gs',
    listDeRegras: '* ',
    duration: 3,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromdatalonga = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 10,
    ativo: false,
    usuario: 'usuario');
DesafioFrom _fromdatacurta = DesafioFrom(
    image: File('imagemock'),
    titulo: '"titulo"',
    tag: '#tag',
    listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
    duration: 1,
    ativo: false,
    usuario: 'usuario');
