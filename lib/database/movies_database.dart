import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'movies_database.g.dart'; //este archivo se genera

class FavoriteMovies extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 100)();

  IntColumn get year => integer().nullable()();

  TextColumn get synopsis => text().nullable()();

  TextColumn get genreIds => text().nullable()();

  TextColumn get trailerSrc => text().nullable()();

  IntColumn get duration => integer().nullable()();

  TextColumn get posterSrc => text().nullable()();
}

LazyDatabase abrirConexion() {
  return LazyDatabase(() async {
    final dbFolder =
        await getApplicationDocumentsDirectory(); //ruta de la carpeta
    final file =
        File(p.join(dbFolder.path, 'favorite_movies.sqlite')); //une con la BD

    return NativeDatabase(file); //retorna la BD
  });
}

@DriftDatabase(tables: [FavoriteMovies])
class AppDatabase extends _$AppDatabase {
  AppDatabase._internal() : super(abrirConexion());

  static final AppDatabase _singleton = AppDatabase._internal();

  factory AppDatabase() {
    return _singleton;
  }

  @override
  int get schemaVersion => 1;

  //CRUD for Users...

  //CRUD for FavoriteMovies
  Future<List<FavoriteMovie>> getAllFavoriteMovies() =>
      select(favoriteMovies).get();

  Future<int> insertFavoriteMovie(FavoriteMoviesCompanion favoriteMovie) =>
      into(favoriteMovies).insert(favoriteMovie);

  Future<int> deleteFavoriteMovie(FavoriteMoviesCompanion favoriteMovie) =>
      delete(favoriteMovies).delete(favoriteMovie);

  Future<bool> updateFavoriteMovie(FavoriteMoviesCompanion favoriteMovie) =>
      update(favoriteMovies).replace(favoriteMovie);

  Future<FavoriteMovie?> getFavoriteMovieByName(String movieName) {
    return (select(favoriteMovies)..where((tbl) => tbl.title.equals(movieName)))
        .getSingleOrNull();
  }
}
