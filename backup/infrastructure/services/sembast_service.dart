import '../../commons/application_constants.dart';
import 'sembast_service_codec.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastService {
  static final SembastService _instance = SembastService._internal();

  factory SembastService({
    DatabaseFactory? databaseFactory,
    bool? useCodec = true,
  }) {
    return _instance._init(databaseFactory, useCodec);
  }

  SembastService._internal();

  Database? _database;
  DatabaseFactory? _databaseFactory;
  bool? _useCodec;

  SembastService _init(
    DatabaseFactory? databaseFactory,
    bool? useCodec,
  ) {
    _databaseFactory = databaseFactory ?? databaseFactoryIo;
    _useCodec = useCodec;
    return this;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = _useCodec == false
        ? await _databaseFactory!.openDatabase(
            ApplicationConstants.databaseName,
          )
        : await _databaseFactory!.openDatabase(
            ApplicationConstants.databaseName,
            codec: SembastCodec(
              signature: ApplicationConstants.hash,
              codec: SembastServiceCodec(),
            ),
          );

    return _database!;
  }
}
