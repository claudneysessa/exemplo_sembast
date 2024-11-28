# SembastService

Neste arquivo apresentamos o serviço SembastService, que é responsável por criar e gerenciar o banco de dados Sembast.<br>
O Sembast é um banco de dados NoSQL embutido, que é uma alternativa ao SQLite. <br>
O Sembast é uma escolha popular para aplicativos Flutter devido à sua simplicidade e facilidade de uso.

```dart

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastService {

  // Instância única do serviço (Singleton)

  static final SembastService _instance = SembastService._internal();

  // Construtor de fábrica para obter a instância única

  factory SembastService({DatabaseFactory? databaseFactory}) {

    // Inicializa o serviço com a fábrica de banco de dados fornecida
    // ou a fábrica padrão (databaseFactoryIo) se não for fornecida.

    return _instance._init(databaseFactory);

  }

  // Construtor privado para evitar a criação de novas instâncias

  SembastService._internal();

  // Armazena a instância do banco de dados

  Database? _database;

  // Armazena a fábrica de banco de dados

  DatabaseFactory? _databaseFactory;

  // Método privado para inicializar o serviço

  SembastService _init(DatabaseFactory? databaseFactory) {

    // Define a fábrica de banco de dados para a fábrica fornecida ou
    // a fábrica padrão (databaseFactoryIo).

    _databaseFactory = databaseFactory ?? databaseFactoryIo;

    // Retorna a instância do serviço

    return this;

  }

  // Getter para obter a instância do banco de dados

  Future<Database> get database async {

    // Verifica se o banco de dados já está aberto.

    if (_database != null) return _database!;

    // Abre o banco de dados usando a fábrica definida
    // com o nome 'exemplo_sembast_trainer'.

    _database = await _databaseFactory!.openDatabase('exemplo_sembast_trainer');

    // Retorna a instância do banco de dados.

    return _database!;

  }

}

```

Dado o código acima, vamos explicar o que ele faz:

# Singleton

```dart

    static final SembastService _instance = SembastService._internal();

    factory SembastService() {
        return _instance;
    }

    SembastService._internal();

```

Este grupo de código implementa o padrão Singleton, garantindo que apenas uma instância do SembastService esteja disponível em todo o aplicativo.

## Explicação:

```dart

    static final SembastService _instance = SembastService._internal();

```

Cria uma instância privada e estática do SembastService chamada \_instance. A palavra-chave static indica que a instância é compartilhada por todas as instâncias da classe, enquanto final garante que a instância seja criada apenas uma vez.

O construtor privado \_internal() é chamado para criar a instância.

```dart

    factory SembastService() {
        return _instance;
    }

```

Define um construtor de fábrica que retorna a instância única (\_instance). A fábrica garante que, ao tentar criar uma instância do SembastService, o código sempre retorne a mesma instância.

```dart

    SembastService._internal();

```

Define um construtor privado para o SembastService. O construtor privado impede que novas instâncias do SembastService sejam criadas diretamente, reforçando o Singleton.

# Benefícios do Singleton:

- Gerenciamento de Estado: Evita que várias instâncias do serviço gerenciem o mesmo banco de dados, evitando inconsistências e corrupção de dados.
- Compartilhamento de Recursos: Permite que diferentes partes do aplicativo compartilhem a mesma instância do serviço, otimizando o uso de recursos e melhorando o desempenho.
- Ponto Único de Acesso: Cria um ponto único para acessar o banco de dados, simplificando o uso do serviço.

# Gerenciamento do Banco de Dados

```dart

Database? _database;

Future<Database> get database async {
  if (_database != null) return _database!;

  final appDocumentDir = await getApplicationDocumentsDirectory();
  final dbPath = '${appDocumentDir.path}/my_database.db';

  _database = await databaseFactoryIo.openDatabase(dbPath);
  return _database!;
}

```

Este grupo de código é responsável por gerenciar a instância do banco de dados.

## Explicação:

```dart

    Database? _database;:

```

Declara uma variável privada chamada \_database para armazenar a instância do banco de dados.

```dart

    Future<Database> get database async { ... }

```

Define um método getter assíncrono chamado database que retorna a instância do banco de dados. Este método é chamado quando você precisa obter acesso ao banco de dados.

## Dentro do método database:

```dart

    if (_database != null) return _database!;

```

Verifica se o banco de dados já está aberto. Se estiver, retorna a instância existente.

```dart

    final appDocumentDir = await getApplicationDocumentsDirectory();

```

Obtem o diretório de documentos do aplicativo, local padrão para armazenamento de dados.

```dart

    final dbPath = '${appDocumentDir.path}/my_database.db';

```

Define o caminho completo para o arquivo do banco de dados.

```dart

    _database = await databaseFactoryIo.openDatabase(dbPath);

```

Abre o banco de dados no caminho especificado, criando um novo arquivo se ele não existir.

```dart

    return _database!;

```

Retorna a instância do banco de dados aberto.

## Em resumo:

O SembastService usa o padrão Singleton para garantir que apenas uma instância do serviço esteja disponível. Ele gerencia a instância do banco de dados, abrindo-o e retornando-o para o aplicativo quando necessário. O banco de dados é armazenado no diretório de documentos do aplicativo, garantindo que os dados sejam acessíveis e seguros.
