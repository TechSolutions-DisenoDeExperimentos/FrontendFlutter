import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tu_cine_app/api_tucine/domain/entities/user.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/user/user_repository_provider.dart';

final userInfoProvider = StateNotifierProvider<UserMapNotifier, Map<String, User>> ((ref) {
  final getUser = ref.watch(userRepositoryProvider);
  return UserMapNotifier(getUser: getUser.getUserById,);
});

typedef GetUserById = Future<User> Function(String id);

typedef GetUserByEmailAndPassword = Future Function();

class UserMapNotifier extends StateNotifier<Map<String, User>> {
  final GetUserById getUser;

  UserMapNotifier({required this.getUser}) : super({});

  Future<void> getUserById(String id) async {
    if(state[id]!= null) return;
    final user = await getUser(id);
    state = {...state, id: user};
  }
}

