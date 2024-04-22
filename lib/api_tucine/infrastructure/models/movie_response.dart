class MovieResponse {
    final int id;
    final String title;
    final int year;
    final String synopsis;
    final String posterSrc;
    final String trailerSrc;
    final int duration;
    final ContentRating contentRating;
    final List<Player> actors;
    final List<Category> categories;

    MovieResponse({
        required this.id,
        required this.title,
        required this.year,
        required this.synopsis,
        required this.posterSrc,
        required this.trailerSrc,
        required this.duration,
        required this.contentRating,
        required this.actors,
        required this.categories,
    });

    factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        synopsis: json["synopsis"],
        posterSrc: json["posterSrc"],
        trailerSrc: json["trailerSrc"],
        duration: json["duration"],
        contentRating: ContentRating.fromJson(json["contentRating"]),
        actors: List<Player>.from(json["actors"].map((x) => Player.fromJson(x))),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "synopsis": synopsis,
        "posterSrc": posterSrc,
        "trailerSrc": trailerSrc,
        "duration": duration,
        "contentRating": contentRating.toJson(),
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Player {
    final int id;
    final String firstName;
    final String lastName;
    final String biography;
    final DateTime birthday;
    final String? profileSrc;

    Player({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.biography,
        required this.birthday,
        required this.profileSrc,
    });

    factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        biography: json["biography"],
        birthday: DateTime.parse(json["birthday"]),
        profileSrc: json["profileSrc"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "biography": biography,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "profileSrc": profileSrc,
    };
}

class Category {
    final int id;
    final String name;

    Category({
        required this.id,
        required this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ContentRating {
    final int id;
    final String name;
    final String description;

    ContentRating({
        required this.id,
        required this.name,
        required this.description,
    });

    factory ContentRating.fromJson(Map<String, dynamic> json) => ContentRating(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
