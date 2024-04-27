
abstract class UserRepository {
  Future<dynamic> getUserById(String userId);
  Future<dynamic> getUserByEmailAndPassword(String email, String password);
}