// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class Food extends DataClass implements Insertable<Food> {
  final int id;
  final String name;
  final String value_protein;
  final String value_lipid;
  final String value_carbon;
  final String value_cal;
  const Food(
      {required this.id,
      required this.name,
      required this.value_protein,
      required this.value_lipid,
      required this.value_carbon,
      required this.value_cal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value_protein'] = Variable<String>(value_protein);
    map['value_lipid'] = Variable<String>(value_lipid);
    map['value_carbon'] = Variable<String>(value_carbon);
    map['value_cal'] = Variable<String>(value_cal);
    return map;
  }

  FoodsCompanion toCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: Value(id),
      name: Value(name),
      value_protein: Value(value_protein),
      value_lipid: Value(value_lipid),
      value_carbon: Value(value_carbon),
      value_cal: Value(value_cal),
    );
  }

  factory Food.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Food(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value_protein: serializer.fromJson<String>(json['value_protein']),
      value_lipid: serializer.fromJson<String>(json['value_lipid']),
      value_carbon: serializer.fromJson<String>(json['value_carbon']),
      value_cal: serializer.fromJson<String>(json['value_cal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value_protein': serializer.toJson<String>(value_protein),
      'value_lipid': serializer.toJson<String>(value_lipid),
      'value_carbon': serializer.toJson<String>(value_carbon),
      'value_cal': serializer.toJson<String>(value_cal),
    };
  }

  Food copyWith(
          {int? id,
          String? name,
          String? value_protein,
          String? value_lipid,
          String? value_carbon,
          String? value_cal}) =>
      Food(
        id: id ?? this.id,
        name: name ?? this.name,
        value_protein: value_protein ?? this.value_protein,
        value_lipid: value_lipid ?? this.value_lipid,
        value_carbon: value_carbon ?? this.value_carbon,
        value_cal: value_cal ?? this.value_cal,
      );
  @override
  String toString() {
    return (StringBuffer('Food(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, value_protein, value_lipid, value_carbon, value_cal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Food &&
          other.id == this.id &&
          other.name == this.name &&
          other.value_protein == this.value_protein &&
          other.value_lipid == this.value_lipid &&
          other.value_carbon == this.value_carbon &&
          other.value_cal == this.value_cal);
}

class FoodsCompanion extends UpdateCompanion<Food> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> value_protein;
  final Value<String> value_lipid;
  final Value<String> value_carbon;
  final Value<String> value_cal;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value_protein = const Value.absent(),
    this.value_lipid = const Value.absent(),
    this.value_carbon = const Value.absent(),
    this.value_cal = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String value_protein,
    required String value_lipid,
    required String value_carbon,
    required String value_cal,
  })  : name = Value(name),
        value_protein = Value(value_protein),
        value_lipid = Value(value_lipid),
        value_carbon = Value(value_carbon),
        value_cal = Value(value_cal);
  static Insertable<Food> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? value_protein,
    Expression<String>? value_lipid,
    Expression<String>? value_carbon,
    Expression<String>? value_cal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value_protein != null) 'value_protein': value_protein,
      if (value_lipid != null) 'value_lipid': value_lipid,
      if (value_carbon != null) 'value_carbon': value_carbon,
      if (value_cal != null) 'value_cal': value_cal,
    });
  }

  FoodsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? value_protein,
      Value<String>? value_lipid,
      Value<String>? value_carbon,
      Value<String>? value_cal}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value_protein: value_protein ?? this.value_protein,
      value_lipid: value_lipid ?? this.value_lipid,
      value_carbon: value_carbon ?? this.value_carbon,
      value_cal: value_cal ?? this.value_cal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value_protein.present) {
      map['value_protein'] = Variable<String>(value_protein.value);
    }
    if (value_lipid.present) {
      map['value_lipid'] = Variable<String>(value_lipid.value);
    }
    if (value_carbon.present) {
      map['value_carbon'] = Variable<String>(value_carbon.value);
    }
    if (value_cal.present) {
      map['value_cal'] = Variable<String>(value_cal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FoodsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, Food> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FoodsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_proteinMeta =
      const VerificationMeta('value_protein');
  @override
  late final GeneratedColumn<String> value_protein = GeneratedColumn<String>(
      'value_protein', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_lipidMeta =
      const VerificationMeta('value_lipid');
  @override
  late final GeneratedColumn<String> value_lipid = GeneratedColumn<String>(
      'value_lipid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_carbonMeta =
      const VerificationMeta('value_carbon');
  @override
  late final GeneratedColumn<String> value_carbon = GeneratedColumn<String>(
      'value_carbon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_calMeta =
      const VerificationMeta('value_cal');
  @override
  late final GeneratedColumn<String> value_cal = GeneratedColumn<String>(
      'value_cal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, value_protein, value_lipid, value_carbon, value_cal];
  @override
  String get aliasedName => _alias ?? 'foods';
  @override
  String get actualTableName => 'foods';
  @override
  VerificationContext validateIntegrity(Insertable<Food> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value_protein')) {
      context.handle(
          _value_proteinMeta,
          value_protein.isAcceptableOrUnknown(
              data['value_protein']!, _value_proteinMeta));
    } else if (isInserting) {
      context.missing(_value_proteinMeta);
    }
    if (data.containsKey('value_lipid')) {
      context.handle(
          _value_lipidMeta,
          value_lipid.isAcceptableOrUnknown(
              data['value_lipid']!, _value_lipidMeta));
    } else if (isInserting) {
      context.missing(_value_lipidMeta);
    }
    if (data.containsKey('value_carbon')) {
      context.handle(
          _value_carbonMeta,
          value_carbon.isAcceptableOrUnknown(
              data['value_carbon']!, _value_carbonMeta));
    } else if (isInserting) {
      context.missing(_value_carbonMeta);
    }
    if (data.containsKey('value_cal')) {
      context.handle(_value_calMeta,
          value_cal.isAcceptableOrUnknown(data['value_cal']!, _value_calMeta));
    } else if (isInserting) {
      context.missing(_value_calMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Food map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Food(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value_protein: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_protein'])!,
      value_lipid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_lipid'])!,
      value_carbon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_carbon'])!,
      value_cal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_cal'])!,
    );
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(attachedDatabase, alias);
  }
}

class Eated extends DataClass implements Insertable<Eated> {
  final int id;
  final String name;
  final String value_protein;
  final String value_lipid;
  final String value_carbon;
  final String value_cal;
  const Eated(
      {required this.id,
      required this.name,
      required this.value_protein,
      required this.value_lipid,
      required this.value_carbon,
      required this.value_cal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value_protein'] = Variable<String>(value_protein);
    map['value_lipid'] = Variable<String>(value_lipid);
    map['value_carbon'] = Variable<String>(value_carbon);
    map['value_cal'] = Variable<String>(value_cal);
    return map;
  }

  EatedsCompanion toCompanion(bool nullToAbsent) {
    return EatedsCompanion(
      id: Value(id),
      name: Value(name),
      value_protein: Value(value_protein),
      value_lipid: Value(value_lipid),
      value_carbon: Value(value_carbon),
      value_cal: Value(value_cal),
    );
  }

  factory Eated.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Eated(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value_protein: serializer.fromJson<String>(json['value_protein']),
      value_lipid: serializer.fromJson<String>(json['value_lipid']),
      value_carbon: serializer.fromJson<String>(json['value_carbon']),
      value_cal: serializer.fromJson<String>(json['value_cal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value_protein': serializer.toJson<String>(value_protein),
      'value_lipid': serializer.toJson<String>(value_lipid),
      'value_carbon': serializer.toJson<String>(value_carbon),
      'value_cal': serializer.toJson<String>(value_cal),
    };
  }

  Eated copyWith(
          {int? id,
          String? name,
          String? value_protein,
          String? value_lipid,
          String? value_carbon,
          String? value_cal}) =>
      Eated(
        id: id ?? this.id,
        name: name ?? this.name,
        value_protein: value_protein ?? this.value_protein,
        value_lipid: value_lipid ?? this.value_lipid,
        value_carbon: value_carbon ?? this.value_carbon,
        value_cal: value_cal ?? this.value_cal,
      );
  @override
  String toString() {
    return (StringBuffer('Eated(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, value_protein, value_lipid, value_carbon, value_cal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Eated &&
          other.id == this.id &&
          other.name == this.name &&
          other.value_protein == this.value_protein &&
          other.value_lipid == this.value_lipid &&
          other.value_carbon == this.value_carbon &&
          other.value_cal == this.value_cal);
}

class EatedsCompanion extends UpdateCompanion<Eated> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> value_protein;
  final Value<String> value_lipid;
  final Value<String> value_carbon;
  final Value<String> value_cal;
  const EatedsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value_protein = const Value.absent(),
    this.value_lipid = const Value.absent(),
    this.value_carbon = const Value.absent(),
    this.value_cal = const Value.absent(),
  });
  EatedsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String value_protein,
    required String value_lipid,
    required String value_carbon,
    required String value_cal,
  })  : name = Value(name),
        value_protein = Value(value_protein),
        value_lipid = Value(value_lipid),
        value_carbon = Value(value_carbon),
        value_cal = Value(value_cal);
  static Insertable<Eated> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? value_protein,
    Expression<String>? value_lipid,
    Expression<String>? value_carbon,
    Expression<String>? value_cal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value_protein != null) 'value_protein': value_protein,
      if (value_lipid != null) 'value_lipid': value_lipid,
      if (value_carbon != null) 'value_carbon': value_carbon,
      if (value_cal != null) 'value_cal': value_cal,
    });
  }

  EatedsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? value_protein,
      Value<String>? value_lipid,
      Value<String>? value_carbon,
      Value<String>? value_cal}) {
    return EatedsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value_protein: value_protein ?? this.value_protein,
      value_lipid: value_lipid ?? this.value_lipid,
      value_carbon: value_carbon ?? this.value_carbon,
      value_cal: value_cal ?? this.value_cal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value_protein.present) {
      map['value_protein'] = Variable<String>(value_protein.value);
    }
    if (value_lipid.present) {
      map['value_lipid'] = Variable<String>(value_lipid.value);
    }
    if (value_carbon.present) {
      map['value_carbon'] = Variable<String>(value_carbon.value);
    }
    if (value_cal.present) {
      map['value_cal'] = Variable<String>(value_cal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EatedsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }
}

class $EatedsTable extends Eateds with TableInfo<$EatedsTable, Eated> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EatedsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_proteinMeta =
      const VerificationMeta('value_protein');
  @override
  late final GeneratedColumn<String> value_protein = GeneratedColumn<String>(
      'value_protein', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_lipidMeta =
      const VerificationMeta('value_lipid');
  @override
  late final GeneratedColumn<String> value_lipid = GeneratedColumn<String>(
      'value_lipid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_carbonMeta =
      const VerificationMeta('value_carbon');
  @override
  late final GeneratedColumn<String> value_carbon = GeneratedColumn<String>(
      'value_carbon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_calMeta =
      const VerificationMeta('value_cal');
  @override
  late final GeneratedColumn<String> value_cal = GeneratedColumn<String>(
      'value_cal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, value_protein, value_lipid, value_carbon, value_cal];
  @override
  String get aliasedName => _alias ?? 'eateds';
  @override
  String get actualTableName => 'eateds';
  @override
  VerificationContext validateIntegrity(Insertable<Eated> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value_protein')) {
      context.handle(
          _value_proteinMeta,
          value_protein.isAcceptableOrUnknown(
              data['value_protein']!, _value_proteinMeta));
    } else if (isInserting) {
      context.missing(_value_proteinMeta);
    }
    if (data.containsKey('value_lipid')) {
      context.handle(
          _value_lipidMeta,
          value_lipid.isAcceptableOrUnknown(
              data['value_lipid']!, _value_lipidMeta));
    } else if (isInserting) {
      context.missing(_value_lipidMeta);
    }
    if (data.containsKey('value_carbon')) {
      context.handle(
          _value_carbonMeta,
          value_carbon.isAcceptableOrUnknown(
              data['value_carbon']!, _value_carbonMeta));
    } else if (isInserting) {
      context.missing(_value_carbonMeta);
    }
    if (data.containsKey('value_cal')) {
      context.handle(_value_calMeta,
          value_cal.isAcceptableOrUnknown(data['value_cal']!, _value_calMeta));
    } else if (isInserting) {
      context.missing(_value_calMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Eated map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Eated(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value_protein: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_protein'])!,
      value_lipid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_lipid'])!,
      value_carbon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_carbon'])!,
      value_cal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_cal'])!,
    );
  }

  @override
  $EatedsTable createAlias(String alias) {
    return $EatedsTable(attachedDatabase, alias);
  }
}

class Achivement extends DataClass implements Insertable<Achivement> {
  final int id;
  final String value_protein;
  final String value_lipid;
  final String value_carbon;
  final String value_cal;
  const Achivement(
      {required this.id,
      required this.value_protein,
      required this.value_lipid,
      required this.value_carbon,
      required this.value_cal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['value_protein'] = Variable<String>(value_protein);
    map['value_lipid'] = Variable<String>(value_lipid);
    map['value_carbon'] = Variable<String>(value_carbon);
    map['value_cal'] = Variable<String>(value_cal);
    return map;
  }

  AchivementsCompanion toCompanion(bool nullToAbsent) {
    return AchivementsCompanion(
      id: Value(id),
      value_protein: Value(value_protein),
      value_lipid: Value(value_lipid),
      value_carbon: Value(value_carbon),
      value_cal: Value(value_cal),
    );
  }

  factory Achivement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Achivement(
      id: serializer.fromJson<int>(json['id']),
      value_protein: serializer.fromJson<String>(json['value_protein']),
      value_lipid: serializer.fromJson<String>(json['value_lipid']),
      value_carbon: serializer.fromJson<String>(json['value_carbon']),
      value_cal: serializer.fromJson<String>(json['value_cal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'value_protein': serializer.toJson<String>(value_protein),
      'value_lipid': serializer.toJson<String>(value_lipid),
      'value_carbon': serializer.toJson<String>(value_carbon),
      'value_cal': serializer.toJson<String>(value_cal),
    };
  }

  Achivement copyWith(
          {int? id,
          String? value_protein,
          String? value_lipid,
          String? value_carbon,
          String? value_cal}) =>
      Achivement(
        id: id ?? this.id,
        value_protein: value_protein ?? this.value_protein,
        value_lipid: value_lipid ?? this.value_lipid,
        value_carbon: value_carbon ?? this.value_carbon,
        value_cal: value_cal ?? this.value_cal,
      );
  @override
  String toString() {
    return (StringBuffer('Achivement(')
          ..write('id: $id, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, value_protein, value_lipid, value_carbon, value_cal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Achivement &&
          other.id == this.id &&
          other.value_protein == this.value_protein &&
          other.value_lipid == this.value_lipid &&
          other.value_carbon == this.value_carbon &&
          other.value_cal == this.value_cal);
}

class AchivementsCompanion extends UpdateCompanion<Achivement> {
  final Value<int> id;
  final Value<String> value_protein;
  final Value<String> value_lipid;
  final Value<String> value_carbon;
  final Value<String> value_cal;
  const AchivementsCompanion({
    this.id = const Value.absent(),
    this.value_protein = const Value.absent(),
    this.value_lipid = const Value.absent(),
    this.value_carbon = const Value.absent(),
    this.value_cal = const Value.absent(),
  });
  AchivementsCompanion.insert({
    this.id = const Value.absent(),
    required String value_protein,
    required String value_lipid,
    required String value_carbon,
    required String value_cal,
  })  : value_protein = Value(value_protein),
        value_lipid = Value(value_lipid),
        value_carbon = Value(value_carbon),
        value_cal = Value(value_cal);
  static Insertable<Achivement> custom({
    Expression<int>? id,
    Expression<String>? value_protein,
    Expression<String>? value_lipid,
    Expression<String>? value_carbon,
    Expression<String>? value_cal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (value_protein != null) 'value_protein': value_protein,
      if (value_lipid != null) 'value_lipid': value_lipid,
      if (value_carbon != null) 'value_carbon': value_carbon,
      if (value_cal != null) 'value_cal': value_cal,
    });
  }

  AchivementsCompanion copyWith(
      {Value<int>? id,
      Value<String>? value_protein,
      Value<String>? value_lipid,
      Value<String>? value_carbon,
      Value<String>? value_cal}) {
    return AchivementsCompanion(
      id: id ?? this.id,
      value_protein: value_protein ?? this.value_protein,
      value_lipid: value_lipid ?? this.value_lipid,
      value_carbon: value_carbon ?? this.value_carbon,
      value_cal: value_cal ?? this.value_cal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (value_protein.present) {
      map['value_protein'] = Variable<String>(value_protein.value);
    }
    if (value_lipid.present) {
      map['value_lipid'] = Variable<String>(value_lipid.value);
    }
    if (value_carbon.present) {
      map['value_carbon'] = Variable<String>(value_carbon.value);
    }
    if (value_cal.present) {
      map['value_cal'] = Variable<String>(value_cal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchivementsCompanion(')
          ..write('id: $id, ')
          ..write('value_protein: $value_protein, ')
          ..write('value_lipid: $value_lipid, ')
          ..write('value_carbon: $value_carbon, ')
          ..write('value_cal: $value_cal')
          ..write(')'))
        .toString();
  }
}

class $AchivementsTable extends Achivements
    with TableInfo<$AchivementsTable, Achivement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchivementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _value_proteinMeta =
      const VerificationMeta('value_protein');
  @override
  late final GeneratedColumn<String> value_protein = GeneratedColumn<String>(
      'value_protein', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_lipidMeta =
      const VerificationMeta('value_lipid');
  @override
  late final GeneratedColumn<String> value_lipid = GeneratedColumn<String>(
      'value_lipid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_carbonMeta =
      const VerificationMeta('value_carbon');
  @override
  late final GeneratedColumn<String> value_carbon = GeneratedColumn<String>(
      'value_carbon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _value_calMeta =
      const VerificationMeta('value_cal');
  @override
  late final GeneratedColumn<String> value_cal = GeneratedColumn<String>(
      'value_cal', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, value_protein, value_lipid, value_carbon, value_cal];
  @override
  String get aliasedName => _alias ?? 'achivements';
  @override
  String get actualTableName => 'achivements';
  @override
  VerificationContext validateIntegrity(Insertable<Achivement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('value_protein')) {
      context.handle(
          _value_proteinMeta,
          value_protein.isAcceptableOrUnknown(
              data['value_protein']!, _value_proteinMeta));
    } else if (isInserting) {
      context.missing(_value_proteinMeta);
    }
    if (data.containsKey('value_lipid')) {
      context.handle(
          _value_lipidMeta,
          value_lipid.isAcceptableOrUnknown(
              data['value_lipid']!, _value_lipidMeta));
    } else if (isInserting) {
      context.missing(_value_lipidMeta);
    }
    if (data.containsKey('value_carbon')) {
      context.handle(
          _value_carbonMeta,
          value_carbon.isAcceptableOrUnknown(
              data['value_carbon']!, _value_carbonMeta));
    } else if (isInserting) {
      context.missing(_value_carbonMeta);
    }
    if (data.containsKey('value_cal')) {
      context.handle(_value_calMeta,
          value_cal.isAcceptableOrUnknown(data['value_cal']!, _value_calMeta));
    } else if (isInserting) {
      context.missing(_value_calMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Achivement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Achivement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      value_protein: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_protein'])!,
      value_lipid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_lipid'])!,
      value_carbon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_carbon'])!,
      value_cal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value_cal'])!,
    );
  }

  @override
  $AchivementsTable createAlias(String alias) {
    return $AchivementsTable(attachedDatabase, alias);
  }
}

abstract class _$PfcDatabase extends GeneratedDatabase {
  _$PfcDatabase(QueryExecutor e) : super(e);
  late final $FoodsTable foods = $FoodsTable(this);
  late final $EatedsTable eateds = $EatedsTable(this);
  late final $AchivementsTable achivements = $AchivementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [foods, eateds, achivements];
}
