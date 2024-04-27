class ShowtimeResponse {
    final int id;
    final String playDate;
    final String playTime;
    final int capacity;
    final double unitPrice;
    final AvailableFilmR availableFilm;

    ShowtimeResponse({
        required this.id,
        required this.playDate,
        required this.playTime,
        required this.capacity,
        required this.unitPrice,
        required this.availableFilm,
    });

    factory ShowtimeResponse.fromJson(Map<String, dynamic> json) => ShowtimeResponse(
        id: json["id"],
        playDate: json["playDate"],
        playTime: json["playTime"],
        capacity: json["capacity"],
        unitPrice: json["unitPrice"],
        availableFilm: AvailableFilmR.fromJson(json["availableFilm"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "playDate": playDate,
        "playTime": playTime,
        "capacity": capacity,
        "unitPrice": unitPrice,
        "availableFilm": availableFilm.toJson(),
    };
}

class AvailableFilmR {
    final int id;
    final String customNotice;
    final String isAvailable;

    AvailableFilmR({
        required this.id,
        required this.customNotice,
        required this.isAvailable,
    });

    factory AvailableFilmR.fromJson(Map<String, dynamic> json) => AvailableFilmR(
        id: json["id"],
        customNotice: json["customNotice"],
        isAvailable: json["isAvailable"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customNotice": customNotice,
        "isAvailable": isAvailable,
    };
}
