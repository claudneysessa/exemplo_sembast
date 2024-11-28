import '../interfaces/spalla_entity_interface.dart';

class TickerEntity implements ISpallaEntity {
  int? id;
  String? stock;
  String? name;
  String? logo;
  String? sector;
  String? type;

  set setId(int id) {
    id = id;
  }

  TickerEntity({
    this.id,
    this.stock,
    this.name,
    this.logo,
    this.sector,
    this.type,
  });

  TickerEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    stock = map['stock'];
    name = map['name'];
    logo = map['logo'];
    sector = map['sector'];
    type = map['type'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stock': stock?.toUpperCase(),
      'name': name,
      'logo': logo,
      'sector': sector,
      'type': type,
    };
  }

  @override
  List<String> getProperties() {
    return [
      'id',
      'stock',
      'name',
      'logo',
      'sector',
      'type',
    ];
  }
}
