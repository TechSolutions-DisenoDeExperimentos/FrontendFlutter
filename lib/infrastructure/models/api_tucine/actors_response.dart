class ActorsResponse {
    final int id;
    final String firstName;
    final String lastName;
    final String biography;
    final DateTime birthday;
    final String? profileSrc;
    final List<Film> films;

    ActorsResponse({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.biography,
        required this.birthday,
        required this.profileSrc,
        required this.films,
    });

    factory ActorsResponse.fromJson(Map<String, dynamic> json) => ActorsResponse(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        profileSrc: json["profileSrc"],
        films: List<Film>.from(json["films"].map((x) => Film.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "biography": biography,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "profileSrc": profileSrc,
        "films": List<dynamic>.from(films.map((x) => x.toJson())),
    };
}

class Film {
    final int id;
    final String title;
    final int year;
    final String synopsis;
    final String? posterSrc;
    final String? trailerSrc;
    final int duration;

    Film({
        required this.id,
        required this.title,
        required this.year,
        required this.synopsis,
        required this.posterSrc,
        required this.trailerSrc,
        required this.duration,
    });

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        synopsis: json["synopsis"],
        posterSrc: json["posterSrc"],
        trailerSrc: json["trailerSrc"],
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "synopsis": synopsis,
        "posterSrc": posterSrc,
        "trailerSrc": trailerSrc,
        "duration": duration,
    };
}
