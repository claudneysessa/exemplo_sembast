import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastService {
  static final SembastService _instance = SembastService._internal();

  factory SembastService({DatabaseFactory? databaseFactory}) {
    return _instance._init(databaseFactory);
  }

  SembastService._internal();

  Database? _database;
  DatabaseFactory? _databaseFactory;

  SembastService _init(DatabaseFactory? databaseFactory) {
    _databaseFactory = databaseFactory ?? databaseFactoryIo;
    return this;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _databaseFactory!.openDatabase('medina_trainer');
    return _database!;
  }
}
