import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String orderID;
  String hallID;
  String customerId;
  Timestamp dateofBooking;
  Timestamp bookedTime;
  String orderDetails;
  bool isDone;

  Order({
    this.orderID,
    this.hallID,
    this.customerId,
    this.dateofBooking,
    this.bookedTime,
    this.orderDetails,
    this.isDone,
  });

  factory Order.fromDoc(DocumentSnapshot dosa) {
    return Order(
      orderID: dosa.documentID,
      hallID: dosa['Hall ID'],
      customerId: dosa['Customer ID'],
      dateofBooking: dosa['Date of Order'],
      bookedTime: dosa['Wanted Date'],
      orderDetails: dosa['Details'],
      isDone: dosa['Order State'],
    );
  }
}
