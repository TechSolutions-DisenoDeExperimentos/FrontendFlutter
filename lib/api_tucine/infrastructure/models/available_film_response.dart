class AvailableFilmResponse {
  final int id;
  final BusinessP business;
  final FilmP film;
  final String customNotice;
  final String isAvailable;
  final PromotionP promotion;

  AvailableFilmResponse({
    required this.id,
    required this.business,
    required this.film,
    required this.customNotice,
    required this.isAvailable,
    required this.promotion,
  });

  factory AvailableFilmResponse.fromJson(Map<String, dynamic> json) =>
      AvailableFilmResponse(
          id: json['id'],
          business: BusinessP.fromJson(json['business']),
          film: FilmP.fromJson(json['film']),
          customNotice: json['customNotice'],
          isAvailable: json['isAvailable'],
          promotion: PromotionP.fromJson(json['promotion']));
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.business != null) {
      data['business'] = this.business!.toJson();
    }
    if (this.film != null) {
      data['film'] = this.film!.toJson();
    }
    data['customNotice'] = this.customNotice;
    data['isAvailable'] = this.isAvailable;
    if (this.promotion != null) {
      data['promotion'] = this.promotion!.toJson();
    }
    return data;
  }*/
}

class BusinessP {
  final int id;
  final String name;
  final String socialReason;
  final String ruc;
  final String phone;
  final String logoSrc;
  final String bannerSrc;
  final String description;
  final String address;
  final String state;
  final int capacity;
  final String openingHours;
  final BusinessTypeP businessType;

  BusinessP({
    required this.id,
    required this.name,
    required this.socialReason,
    required this.ruc,
    required this.phone,
    required this.logoSrc,
    required this.bannerSrc,
    required this.description,
    required this.address,
    required this.state,
    required this.capacity,
    required this.openingHours,
    required this.businessType,
  });

  factory BusinessP.fromJson(Map<String, dynamic> json) => BusinessP(
      id: json['id'],
      name: json['name'],
      socialReason: json['socialReason'],
      ruc: json['ruc'],
      phone: json['phone'],
      logoSrc: json['logoSrc'],
      bannerSrc: json['bannerSrc'],
      description: json['description'],
      address: json['address'],
      state: json['state'],
      capacity: json['capacity'],
      openingHours: json['openingHours'],
      businessType: BusinessTypeP.fromJson(json['businessType']));
}

class BusinessTypeP {
  final int id;
  final String name;

  BusinessTypeP({
    required this.id,
    required this.name,
  });

  factory BusinessTypeP.fromJson(Map<String, dynamic> json) =>
      BusinessTypeP(id: json['id'], name: json['name']);
}

class FilmP {
  final int id;
  final String title;
  final int year;
  final String synopsis;
  final String posterSrc;
  final String trailerSrc;
  final int duration;

  FilmP({
    required this.id,
    required this.title,
    required this.year,
    required this.synopsis,
    required this.posterSrc,
    required this.trailerSrc,
    required this.duration,
  });

  factory FilmP.fromJson(Map<String, dynamic> json) => FilmP(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      synopsis: json['synopsis'],
      posterSrc: json['posterSrc'],
      trailerSrc: json['trailerSrc'],
      duration: json['duration']);
}

class PromotionP {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final String description;
  final String imageSrc;
  final double discount;

  PromotionP({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.imageSrc,
    required this.discount,
  });

  factory PromotionP.fromJson(Map<String, dynamic> json) => PromotionP(
        id: json['id'],
        title: json['title'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        description: json['description'],
        imageSrc: json['imageSrc'],
        discount: json['discount'],
      );
}
