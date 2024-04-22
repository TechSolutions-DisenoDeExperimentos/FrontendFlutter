// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_database.dart';

// ignore_for_file: type=lint
class $FavoriteMoviesTable extends FavoriteMovies
    with TableInfo<$FavoriteMoviesTable, FavoriteMovie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMoviesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
      'year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _synopsisMeta =
      const VerificationMeta('synopsis');
  @override
  late final GeneratedColumn<String> synopsis = GeneratedColumn<String>(
      'synopsis', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genreIdsMeta =
      const VerificationMeta('genreIds');
  @override
  late final GeneratedColumn<String> genreIds = GeneratedColumn<String>(
      'genre_ids', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trailerSrcMeta =
      const VerificationMeta('trailerSrc');
  @override
  late final GeneratedColumn<String> trailerSrc = GeneratedColumn<String>(
      'trailer_src', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _posterSrcMeta =
      const VerificationMeta('posterSrc');
  @override
  late final GeneratedColumn<String> posterSrc = GeneratedColumn<String>(
      'poster_src', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, year, synopsis, genreIds, trailerSrc, duration, posterSrc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_movies';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMovie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    }
    if (data.containsKey('synopsis')) {
      context.handle(_synopsisMeta,
          synopsis.isAcceptableOrUnknown(data['synopsis']!, _synopsisMeta));
    }
    if (data.containsKey('genre_ids')) {
      context.handle(_genreIdsMeta,
          genreIds.isAcceptableOrUnknown(data['genre_ids']!, _genreIdsMeta));
    }
    if (data.containsKey('trailer_src')) {
      context.handle(
          _trailerSrcMeta,
          trailerSrc.isAcceptableOrUnknown(
              data['trailer_src']!, _trailerSrcMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('poster_src')) {
      context.handle(_posterSrcMeta,
          posterSrc.isAcceptableOrUnknown(data['poster_src']!, _posterSrcMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMovie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMovie(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      year: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}year']),
      synopsis: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}synopsis']),
      genreIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genre_ids']),
      trailerSrc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trailer_src']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      posterSrc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}poster_src']),
    );
  }

  @override
  $FavoriteMoviesTable createAlias(String alias) {
    return $FavoriteMoviesTable(attachedDatabase, alias);
  }
}

class FavoriteMovie extends DataClass implements Insertable<FavoriteMovie> {
  final int id;
  final String title;
  final int? year;
  final String? synopsis;
  final String? genreIds;
  final String? trailerSrc;
  final int? duration;
  final String? posterSrc;
  const FavoriteMovie(
      {required this.id,
      required this.title,
      this.year,
      this.synopsis,
      this.genreIds,
      this.trailerSrc,
      this.duration,
      this.posterSrc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || synopsis != null) {
      map['synopsis'] = Variable<String>(synopsis);
    }
    if (!nullToAbsent || genreIds != null) {
      map['genre_ids'] = Variable<String>(genreIds);
    }
    if (!nullToAbsent || trailerSrc != null) {
      map['trailer_src'] = Variable<String>(trailerSrc);
    }
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    if (!nullToAbsent || posterSrc != null) {
      map['poster_src'] = Variable<String>(posterSrc);
    }
    return map;
  }

  FavoriteMoviesCompanion toCompanion(bool nullToAbsent) {
    return FavoriteMoviesCompanion(
      id: Value(id),
      title: Value(title),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      synopsis: synopsis == null && nullToAbsent
          ? const Value.absent()
          : Value(synopsis),
      genreIds: genreIds == null && nullToAbsent
          ? const Value.absent()
          : Value(genreIds),
      trailerSrc: trailerSrc == null && nullToAbsent
          ? const Value.absent()
          : Value(trailerSrc),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      posterSrc: posterSrc == null && nullToAbsent
          ? const Value.absent()
          : Value(posterSrc),
    );
  }

  factory FavoriteMovie.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteMovie(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      year: serializer.fromJson<int?>(json['year']),
      synopsis: serializer.fromJson<String?>(json['synopsis']),
      genreIds: serializer.fromJson<String?>(json['genreIds']),
      trailerSrc: serializer.fromJson<String?>(json['trailerSrc']),
      duration: serializer.fromJson<int?>(json['duration']),
      posterSrc: serializer.fromJson<String?>(json['posterSrc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'year': serializer.toJson<int?>(year),
      'synopsis': serializer.toJson<String?>(synopsis),
      'genreIds': serializer.toJson<String?>(genreIds),
      'trailerSrc': serializer.toJson<String?>(trailerSrc),
      'duration': serializer.toJson<int?>(duration),
      'posterSrc': serializer.toJson<String?>(posterSrc),
    };
  }

  FavoriteMovie copyWith(
          {int? id,
          String? title,
          Value<int?> year = const Value.absent(),
          Value<String?> synopsis = const Value.absent(),
          Value<String?> genreIds = const Value.absent(),
          Value<String?> trailerSrc = const Value.absent(),
          Value<int?> duration = const Value.absent(),
          Value<String?> posterSrc = const Value.absent()}) =>
      FavoriteMovie(
        id: id ?? this.id,
        title: title ?? this.title,
        year: year.present ? year.value : this.year,
        synopsis: synopsis.present ? synopsis.value : this.synopsis,
        genreIds: genreIds.present ? genreIds.value : this.genreIds,
        trailerSrc: trailerSrc.present ? trailerSrc.value : this.trailerSrc,
        duration: duration.present ? duration.value : this.duration,
        posterSrc: posterSrc.present ? posterSrc.value : this.posterSrc,
      );
  @override
  String toString() {
    return (StringBuffer('FavoriteMovie(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('synopsis: $synopsis, ')
          ..write('genreIds: $genreIds, ')
          ..write('trailerSrc: $trailerSrc, ')
          ..write('duration: $duration, ')
          ..write('posterSrc: $posterSrc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, year, synopsis, genreIds, trailerSrc, duration, posterSrc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteMovie &&
          other.id == this.id &&
          other.title == this.title &&
          other.year == this.year &&
          other.synopsis == this.synopsis &&
          other.genreIds == this.genreIds &&
          other.trailerSrc == this.trailerSrc &&
          other.duration == this.duration &&
          other.posterSrc == this.posterSrc);
}

class FavoriteMoviesCompanion extends UpdateCompanion<FavoriteMovie> {
  final Value<int> id;
  final Value<String> title;
  final Value<int?> year;
  final Value<String?> synopsis;
  final Value<String?> genreIds;
  final Value<String?> trailerSrc;
  final Value<int?> duration;
  final Value<String?> posterSrc;
  const FavoriteMoviesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.year = const Value.absent(),
    this.synopsis = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.trailerSrc = const Value.absent(),
    this.duration = const Value.absent(),
    this.posterSrc = const Value.absent(),
  });
  FavoriteMoviesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.year = const Value.absent(),
    this.synopsis = const Value.absent(),
    this.genreIds = const Value.absent(),
    this.trailerSrc = const Value.absent(),
    this.duration = const Value.absent(),
    this.posterSrc = const Value.absent(),
  }) : title = Value(title);
  static Insertable<FavoriteMovie> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? year,
    Expression<String>? synopsis,
    Expression<String>? genreIds,
    Expression<String>? trailerSrc,
    Expression<int>? duration,
    Expression<String>? posterSrc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (year != null) 'year': year,
      if (synopsis != null) 'synopsis': synopsis,
      if (genreIds != null) 'genre_ids': genreIds,
      if (trailerSrc != null) 'trailer_src': trailerSrc,
      if (duration != null) 'duration': duration,
      if (posterSrc != null) 'poster_src': posterSrc,
    });
  }

  FavoriteMoviesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int?>? year,
      Value<String?>? synopsis,
      Value<String?>? genreIds,
      Value<String?>? trailerSrc,
      Value<int?>? duration,
      Value<String?>? posterSrc}) {
    return FavoriteMoviesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      synopsis: synopsis ?? this.synopsis,
      genreIds: genreIds ?? this.genreIds,
      trailerSrc: trailerSrc ?? this.trailerSrc,
      duration: duration ?? this.duration,
      posterSrc: posterSrc ?? this.posterSrc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (synopsis.present) {
      map['synopsis'] = Variable<String>(synopsis.value);
    }
    if (genreIds.present) {
      map['genre_ids'] = Variable<String>(genreIds.value);
    }
    if (trailerSrc.present) {
      map['trailer_src'] = Variable<String>(trailerSrc.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (posterSrc.present) {
      map['poster_src'] = Variable<String>(posterSrc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMoviesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('year: $year, ')
          ..write('synopsis: $synopsis, ')
          ..write('genreIds: $genreIds, ')
          ..write('trailerSrc: $trailerSrc, ')
          ..write('duration: $duration, ')
          ..write('posterSrc: $posterSrc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $FavoriteMoviesTable favoriteMovies = $FavoriteMoviesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteMovies];
}
