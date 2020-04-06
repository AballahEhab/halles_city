import 'package:halls_city/models/reservation.dart';

class Schedule {
  List<Reservation> reservations;

  Schedule() {
    reservations = new List();
  }

  void addNewReservation(DateTime start, DateTime end, var userName) {
    Reservation reservation = Reservation(start, end, userName);
    reservations.add(reservation);
  }

  Reservation checkStartingDate(DateTime startDate) {
    for (int counter = 0; counter < reservations.length; counter++) {
      Reservation a_reservation = reservations[counter];

      if (startDate.isAtSameMomentAs(a_reservation.start)) {
        return a_reservation;
      } else if (startDate.isAtSameMomentAs(a_reservation.end)) {
        return null;
      } else {
        if (startDate.isAfter(a_reservation.start)) {
          if (startDate.isBefore(a_reservation.end)) {
            return a_reservation;
          }
        }
      }
    }
    return null;
  }

  Reservation checkEndDate(DateTime endDate) {
    for (int counter = 0; counter < reservations.length; counter++) {
      Reservation a_reservation = reservations[counter];

      if (endDate.isAtSameMomentAs(a_reservation.end)) {
        return a_reservation;
      } else if (endDate.isAtSameMomentAs(a_reservation.start)) {
        return null;
      } else {
        if (endDate.isAfter(a_reservation.start)) {
          if (endDate.isBefore(a_reservation.end)) {
            return a_reservation;
          }
        }
      }
    }
    return null;
  }
}
