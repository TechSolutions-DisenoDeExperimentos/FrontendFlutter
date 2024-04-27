abstract class AvailableFilmsDatasource {
  Future<dynamic> getAvailableFilmsById(String avFilmId);
  Future<dynamic> getAllAvailableFilms();
}
