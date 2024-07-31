import 'dart:math';

import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class User {
  final int id;
  final String nome;

  User({required this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome};
  }
}

class Class {
  final int id;
  final String nome;
  final DateTime data;

  Class({required this.id, required this.nome, required this.data});

  Map<String, dynamic> toMap() {
    return {'id': id, 'nome': nome, 'data': data.toIso8601String()};
  }
}

void main() async {
  Logger logger = Logger();

  final dbPath = path.join(path.dirname(path.current), 'exemplo01.sql3');

  logger.i('Caminho do banco de dados: $dbPath');

  final databaseFactory = databaseFactoryIo;

  final database = await databaseFactory.openDatabase(dbPath);

  // Store para usuários
  final userStore = intMapStoreFactory.store('users');

  // Store para aulas
  final classStore = intMapStoreFactory.store('classes');

  // Criar um usuário
  final usuario1 = User(id: Random().nextInt(1000), nome: 'João da Silva');

  // Inserir o usuário no banco de dados
  await userStore.add(database, usuario1.toMap());

  // Criar uma aula
  final aula1 = Class(
      id: Random().nextInt(1000),
      nome: 'Introdução à Programação',
      data: DateTime.now());

  // Inserir a aula no banco de dados
  await classStore.add(database, aula1.toMap());

  // Recuperar usuários e imprimir
  final usuarios = await userStore.find(database);
  logger.i('Usuários recuperados: ${usuarios.map((e) => e.value).toList()}');

  // Recuperar aulas e imprimir
  final aulas = await classStore.find(database);
  logger.i('Aulas recuperadas: ${aulas.map((e) => e.value).toList()}');

  await database.close();
}
