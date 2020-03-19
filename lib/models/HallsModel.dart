import 'package:cloud_firestore/cloud_firestore.dart';

class Hall {
  String id;
  String hallName;
  String ownerID;
  String imgUrls;
  String hallAdress;
  String halldesc;
  double hallrating;
  String hallType;

  Hall({
    this.id,
    this.hallName,
    this.ownerID,
    this.imgUrls,
    this.hallAdress,
    this.halldesc,
    this.hallrating,
    this.hallType,
  });

  factory Hall.fromDoc(DocumentSnapshot dosa) {
    return Hall(
        id: dosa.documentID,
        hallName: dosa['Hall Name'],
        ownerID: dosa['Owner ID'],
        imgUrls: dosa['Halls Images URLs'],
        hallAdress: dosa['Hall Address'],
        halldesc: dosa['Dsciption'],
        hallrating: dosa['Rating'],
        hallType: dosa['Hall Type']);
  }
}
