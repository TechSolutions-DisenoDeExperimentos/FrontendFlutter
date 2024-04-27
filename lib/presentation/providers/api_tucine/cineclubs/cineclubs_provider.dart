import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/presentation/providers/api_tucine/cineclubs/cineclub_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cineclubsProvider = StateNotifierProvider<CineclubsNotifier, List<Cineclub>>((ref) {
  
  final fetchCineclubs = ref.watch(cineclubRepositoryProvider).getCineclubs;

  return CineclubsNotifier(
      fetchCineclubs: fetchCineclubs
  );
});


typedef CineclubCallBack = Future<List<Cineclub>> Function();

class CineclubsNotifier extends StateNotifier<List<Cineclub>>{
  
  CineclubCallBack fetchCineclubs;

  CineclubsNotifier({
    required this.fetchCineclubs
  }): super([]);

  Future<void> getCineclubs() async{
    final cineclubs = await fetchCineclubs();
    state = [...state, ...cineclubs];
  }
}