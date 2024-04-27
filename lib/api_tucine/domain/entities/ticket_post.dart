class TicketPost {
  int numberSeats;
  double totalPrice;
  int userId;
  int showtimeId;

  TicketPost({
    required this.numberSeats,
    required this.totalPrice,
    required this.userId,
    required this.showtimeId,
  });

  factory TicketPost.fromJson(Map<String, dynamic> json) {
    return TicketPost(
      numberSeats: json['numberSeats'] as int,
      totalPrice: json['totalPrice'] as double,
      userId: json['user']['id'] as int,
      showtimeId: json['showtime']['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'numberSeats': numberSeats,
      'totalPrice': totalPrice,
      'user': {'id': userId},
      'showtime': {'id': showtimeId},
    };
  }
}