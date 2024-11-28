# Código

```dart
import 'package:logger/logger.dart';
import 'package:path/path.dart' as path;
import 'package:sembast/sembast_io.dart';

import 'package:exemplo_sembast/domain/repositories/modalidade_repository.dart';
import 'package:exemplo_sembast/domain/repositories/aluno_repository.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/modalidade_dao.dart';
import 'package:exemplo_sembast/infrastructure/data_access/dao/aluno_dao.dart';

import '../../bin/docs/exemplo_aluno.dart';
import '../../bin/docs/exemplo_modalidade.dart';

void main() async {
  Logger logger = Logger();

  final dbPath = path.join(path.dirname(path.current), 'exemplo_sembast.sql3');

  logger.i('Caminho do banco de dados: $dbPath');

  final databaseFactory = databaseFactoryIo;
  final database = await databaseFactory.openDatabase(dbPath);

  final alunoDAO = AlunoDAO(database);
  final alunoRepository = AlunoRepository(alunoDAO);
  await exemploAluno(logger, alunoRepository);

  final modalidadeDAO = ModalidadeDAO(database);
  final modalidadeRepository = ModalidadeRepository(modalidadeDAO);
  await exemploModalidade(logger, modalidadeRepository);

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
      .openDatabase('exemplo_sembast_memory'); // Abre o banco em memória

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

Usa a databaseFactory para abrir o banco de dados com o nome 'exemplo_sembast.sql3' e o caminho definido em dbPath.

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

- Localização: Ocorre nos construtores dos repositórios AlunoRepository e ModalidadeRepository.

#### Explicação:

- Os repositórios AlunoRepository e ModalidadeRepository recebem as instâncias dos DAOs (AlunoDAO e ModalidadeDAO) como parâmetros no construtor. Isso significa que as dependências são injetadas no repositório no momento da criação.

#### Exemplo:

```dart
final alunoRepository = AlunoRepository(alunoDAO);
final modalidadeRepository = ModalidadeRepository(modalidadeDAO);
```

### 4. Inversão de Dependência:

- Localização: Ocorre na forma como os repositórios interagem com os DAOs.

#### Explicação:

Os repositórios dependem de uma interface (IDAO) para realizar operações com os dados, e não de uma implementação específica.<br>
Os repositórios não se preocupam com a implementação do banco de dados, e os DAOs são injetados como dependências.<br>
A implementação do banco de dados pode ser trocada facilmente sem afetar o código do repositório.

#### Exemplo:

```dart

// AlunoRepository

class AlunoRepository {
  final AlunoDAO _alunoDAO;

  AlunoRepository(this._alunoDAO);

  Future<int> insert(AlunoEntity alunoEnity) async {
    return await _alunoDAO.insert(alunoEnity);
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

Cada Modalidadee tem uma responsabilidade única e bem definida. As entidades (Aluno, Modalidade) representam os dados, os DAOs interagem com o banco de dados, os repositórios encapsulam a lógica de acesso a dados, e os exemplos (exemploAluno, exemploModalidade) demonstram o uso.

### 6. Banco de Dados Sembast

O código usa a biblioteca sembast para interagir com um banco de dados Sembast local.<br>
O databaseFactoryIo é usado para abrir um banco de dados físico em disco.<br>
O banco de dados é aberto usando o caminho dbPath, que é configurado para 'exemplo_sembast.sql3' no diretório atual.

### 7. Repositórios

Os repositórios AlunoRepository e ModalidadeRepository fornecem uma interface mais abstrata para interagir com as entidades, escondendo a complexidade do banco de dados. Eles delegam as operações CRUD aos DAOs.
