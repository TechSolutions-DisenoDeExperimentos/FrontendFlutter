
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'Does not exist';
  static String theMovieDbBaseUrl = dotenv.env['THE_MOVIE_DB_BASE_URL'] ?? 'Does not exist';
  static String theMovieDbImagesUrl = dotenv.env['THE_MOVIE_DB_IMAGES_URL'] ?? 'Does not exist';
  static String theTuCineBaseUrl = dotenv.env['THE_TU_CINE_BASE_URL'] ?? 'Does not exist';
}