# Código

```dart
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast_io.dart';

import 'package:medina/domain/repositories/class_repository.dart';
import 'package:medina/domain/repositories/user_repository.dart';
import 'package:medina/infrastructure/data_access/dao/class_dao.dart';
import 'package:medina/infrastructure/data_access/dao/user_dao.dart';

import 'exemplo_user.dart';
import 'exemplo_class.dart';

void main() async {
  Logger logger = Logger();

  final dbPath = path.join(path.dirname(path.current), 'medina.sql3');

  logger.i('Caminho do banco de dados: $dbPath');

  final databaseFactory = databaseFactoryIo;
  final database = await databaseFactory.openDatabase(dbPath);

  final userDAO = UserDAO(database);
  final userRepository = UserRepository(userDAO);
  await exemploUser(logger, userRepository);

  final classDAO = ClassDAO(database);
  final classRepository = ClassRepository(classDAO);
  await exemploClass(logger, classRepository);

  await database.close();
}
```

O código em questão demonstra os princípios SOLID focando principalmente nas técnicas de Injeção de Dependência e Inversão de Dependência.

## Vamos analisar cada um:

### 1. DatabaseFactory:

Função:

- A DatabaseFactory é um objeto responsável por criar instâncias do Database. Em outras palavras, é como um "fabricante" de bancos de dados.

Tipos de DatabaseFactory:

- A biblioteca sembast oferece diferentes tipos de fábricas de bancos de dados, como:
  - databaseFactoryIo: Cria um banco de dados físico no sistema de arquivos.
  - databaseFactoryMemory: Cria um banco de dados em memória, que não é persistente.
  - databaseFactoryServer: Cria um banco de dados em um servidor remoto.

Objetivo:

- A DatabaseFactory permite que você escolha a implementação do banco de dados que você deseja usar.

Neste caso temos 2 exemplos:

```dart

  // Cria a fábrica de banco de dados em arquivo

  final databaseFactory = databaseFactoryIo;
  final database = await databaseFactory.openDatabase(dbPath);

```

Este exemplo trabalha com arquivo fisicona estrutura do dispositivo

```dart

  // Cria a fábrica de banco de dados em memória

  final databaseFactory = databaseFactoryMemory;
  final database = await databaseFactory
      .openDatabase('medina_memory'); // Abre o banco em memória

```

Este exemplo trabalha com o database em memório, ou seja, não é persistente.

### 2. Database:

Função:

- O Database representa a instância do banco de dados que você está usando.

Ele fornece os métodos necessários para interagir com o banco de dados, como:

- insert: Inserir novos dados.
- find: Pesquisar dados.
- update: Atualizar dados.
- delete: Deletar dados.
- close: Fechar a conexão com o banco de dados.

Exemplo:

- O código que você forneceu utiliza a DatabaseFactory databaseFactoryIo para criar um banco de dados físico em disco. A instância do Database é criada usando databaseFactory.openDatabase(dbPath).

### O Código em Detalhes:

```dart
final databaseFactory = databaseFactoryIo;
```

Cria uma instância da DatabaseFactory databaseFactoryIo, que é responsável por criar bancos de dados físicos no sistema de arquivos.

```dart
final database = await databaseFactory.openDatabase(dbPath);
```

Usa a databaseFactory para abrir o banco de dados com o nome 'medina.sql3' e o caminho definido em dbPath.

O método openDatabase é assíncrono, então você precisa usar a palavra-chave await para esperar que o banco de dados seja aberto.

### Uso do Database:

Após o banco de dados ser aberto, você pode usar a instância database para realizar operações no banco de dados, como inserir dados, pesquisar dados, etc.

### Fechamento do Banco de Dados:

É importante fechar a conexão com o banco de dados usando database.close() quando você terminar de usá-lo para liberar recursos.

## Em resumo:

- A DatabaseFactory é como um fabricante de bancos de dados.
- O Database é a instância real do banco de dados que você está usando.
- Você precisa de uma DatabaseFactory para criar uma instância de Database.

### 3. Injeção de Dependência:

- Localização: Ocorre nos construtores dos repositórios UserRepository e ClassRepository.

#### Explicação:

- Os repositórios UserRepository e ClassRepository recebem as instâncias dos DAOs (userDAO e classDAO) como parâmetros no construtor. Isso significa que as dependências são injetadas no repositório no momento da criação.

#### Exemplo:

```dart
final userRepository = UserRepository(userDAO);
final classRepository = ClassRepository(classDAO);
```

### 4. Inversão de Dependência:

- Localização: Ocorre na forma como os repositórios interagem com os DAOs.

#### Explicação:

Os repositórios dependem de uma interface (IDAO) para realizar operações com os dados, e não de uma implementação específica.<br>
Os repositórios não se preocupam com a implementação do banco de dados, e os DAOs são injetados como dependências.<br>
A implementação do banco de dados pode ser trocada facilmente sem afetar o código do repositório.

#### Exemplo:

```dart

// UserRepository

class UserRepository {
  final UserDAO _userDAO;

  UserRepository(this._userDAO);

  Future<int> insertUser(User user) async {
    return await _userDAO.insert(user);
  }
}

```

### Vantagens:

- Flexibilidade: A Inversão de Dependência permite trocar a implementação do banco de dados (DAO) sem afetar o código do repositório, tornando o código mais flexível e fácil de testar.
- Testes: A Injeção de Dependência facilita a criação de mocks dos DAOs durante os testes, permitindo que você teste a lógica do repositório de forma isolada.
- Modularidade: A Inversão de Dependência promove a modularidade do código, tornando cada módulo responsável por suas dependências e facilitando a manutenção e o gerenciamento do código.

### Observações:

O código em questão utiliza um padrão simples de injeção de dependência. Para projetos maiores, frameworks de injeção de dependência como get_it, provider ou Injector podem ser mais eficientes e estruturados.

A Inversão de Dependência é um princípio fundamental do SOLID, que visa promover o desacoplamento e a flexibilidade no código.

### 5. Single Responsibility Principle (SRP)

Cada classe tem uma responsabilidade única e bem definida. As entidades (User, Class) representam os dados, os DAOs interagem com o banco de dados, os repositórios encapsulam a lógica de acesso a dados, e os exemplos (exemploUser, exemploClass) demonstram o uso.

### 6. Banco de Dados Sembast

O código usa a biblioteca sembast para interagir com um banco de dados Sembast local.<br>
O databaseFactoryIo é usado para abrir um banco de dados físico em disco.<br>
O banco de dados é aberto usando o caminho dbPath, que é configurado para 'medina.sql3' no diretório atual.

### 7. Repositórios

Os repositórios UserRepository e ClassRepository fornecem uma interface mais abstrata para interagir com as entidades, escondendo a complexidade do banco de dados. Eles delegam as operações CRUD aos DAOs.
