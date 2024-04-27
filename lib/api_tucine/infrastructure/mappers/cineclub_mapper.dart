import 'package:tu_cine_app/api_tucine/domain/entities/cineclub.dart';
import 'package:tu_cine_app/api_tucine/infrastructure/models/cineclub_response.dart';

class CineclubMapper {
  static Cineclub cineclubToEntity(CineclubResponse cineclubResponse) =>
      Cineclub(
        id: cineclubResponse.id,
        name: cineclubResponse.name,
        socialReason: cineclubResponse.socialReason,
        ruc: cineclubResponse.ruc,
        phone: cineclubResponse.phone,
        logoSrc: cineclubResponse.logoSrc != null
            ? '${cineclubResponse.logoSrc}'
            : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
        bannerSrc: cineclubResponse.bannerSrc != null
            ? '${cineclubResponse.bannerSrc}'
            : 'https://qph.cf2.quoracdn.net/main-qimg-6d72b77c81c9841bd98fc806d702e859-lq',
        description: cineclubResponse.description != null
            ? '${cineclubResponse.description}'
            : 'No hay información',
        address: cineclubResponse.address,
        state: cineclubResponse.state != null
            ? '${cineclubResponse.state}'
            : 'No hay información',
        capacity: cineclubResponse.capacity ?? 0,
        openingHours: cineclubResponse.openingHours != null
            ? '${cineclubResponse.openingHours}'
            : 'No hay información',
      );
}
