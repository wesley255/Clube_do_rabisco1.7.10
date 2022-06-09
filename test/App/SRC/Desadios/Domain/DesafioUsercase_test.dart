import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:testes_de_estudos/App/LocalServices/set_Clock.dart';
import 'package:testes_de_estudos/App/SRC/Desadios/Domain/DesafioUsercase.dart';
import 'package:testes_de_estudos/App/SRC/Desadios/Domain/Entitys/Desafio_Entity.dart';
import 'package:testes_de_estudos/App/SRC/Desadios/Domain/error/Desfio_Expition.dart';

DesafiosUsercaseContracte desafioUsercasemock = DesafiosUsercase();
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
  test('data invalida', () async {
    var resut = await desafioUsercasemock.validarAndSaveDesafio(_fromdatahoje);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).dataLimite,
        'Data invalida!');
  });
  test('data antiga', () async {
    var resut =
        await desafioUsercasemock.validarAndSaveDesafio(_fromdataantiga);
    expect(resut.isLeft(), true);
    expect((resut.fold((l) => l, (r) => null) as DesafioExpition).dataLimite,
        'Data invalida!');
  });
}

DesafioFrom _fromCerto = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromtitulocurto = DesafioFrom(
  image: File('imagemock'),
  titulo: '"ti"',
  tag: '#tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromtitulomuitoLongo = DesafioFrom(
  image: File('imagemock'),
  titulo: '"12345678912450554463547851454"',
  tag: '#tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromtaginvalida = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: 'tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromtagcurta = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#gs',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromListaDeRegrasVasia = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#gs',
  listDeRegras: '',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromListaDeRegrascurta = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#gs',
  listDeRegras: '* ',
  dataLimite: ClockRemainingTime.getFuturedata(addtime: Duration(days: 3)),
);
DesafioFrom _fromdatahoje = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: DateTime.now(),
);
DesafioFrom _fromdataantiga = DesafioFrom(
  image: File('imagemock'),
  titulo: '"titulo"',
  tag: '#tag',
  listDeRegras: 'regra1' '\n' 'regra2 ' '\n' 'regra3',
  dataLimite: DateTime.utc(2022, 06, 7),
);
