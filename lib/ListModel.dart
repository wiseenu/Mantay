final String tableModel = 'mantay';

class ModelFields {
  static final List<String> values = [id, name, uk1, uk2, uk3];

  static final String id = '_id';
  static final String name = '_name';
  static final String uk1 = '_uk1';
  static final String uk2 = '_uk2';
  static final String uk3 = '_uk3';
}

class ModelList {
  final int? id;
  final String name;
  final String uk1;
  final String uk2;
  final String uk3;

  const ModelList({
    this.id,
    required this.name,
    required this.uk1,
    required this.uk2,
    required this.uk3,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'uk1': uk1,
      'uk2': uk2,
      'uk3': uk3,
    };
  }

  factory ModelList.FromMap(Map<String, dynamic> map) {
    return ModelList(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      uk1: map['uk1'] ?? '',
      uk2: map['uk2'] ?? '',
      uk3: map['uk3'] ?? '',
    );
  }

  @override
  String toString() {
    return 'ModelList(id: $id, name: $name,uk1: $uk1,uk2: $uk2,uk3: $uk3,)';
  }

  static ModelList fromJson(Map<String, Object?> json) => ModelList(
        id: json[ModelFields.id] as int?,
        name: json[ModelFields.name] as String,
        uk1: json[ModelFields.uk1].toString(),
        uk2: json[ModelFields.uk2].toString(),
        uk3: json[ModelFields.uk3].toString(),
      );

  Map<String, Object?> toJson() => {
        ModelFields.id: id,
        ModelFields.name: name,
        ModelFields.uk1: uk1,
        ModelFields.uk2: uk2,
        ModelFields.uk3: uk3,
      };

  ModelList copy({
    int? id,
    String? name,
    String? uk1,
    String? uk2,
    String? uk3,
  }) =>
      ModelList(
        id: id ?? this.id,
        name: name ?? this.name,
        uk1: uk1 ?? this.uk1,
        uk2: uk2 ?? this.uk2,
        uk3: uk3 ?? this.uk3,
      );
}
