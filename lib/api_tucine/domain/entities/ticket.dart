class Ticket {
  final int id;
  final int numberSeats;
  final double totalPrice;
  final String status;
  final String dateEmition;
  //final User user;
  final int userId;
  final int showtimeId;
  //final Showtime showtime;
  //final int availableFilmId;

  Ticket(
      {required this.id,
      required this.numberSeats,
      required this.totalPrice,
      required this.status,
      required this.dateEmition,
      //required this.user,
      //required this.showtime
      required this.userId,
      required this.showtimeId,
      //required this.availableFilmId
      });
}
