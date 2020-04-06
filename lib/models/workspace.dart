import 'package:halls_city/models/hall.dart';
import 'package:halls_city/models/workspace_room.dart';

class WorkSpace extends Hall {
  List<Room> rooms;

  WorkSpace(
      {String workSpaceName,
      List workSpaceImages,
      var workSpaceLocation,
      num workSpaceRatnig,
      String address,
      bool workSpacewifi,
      bool workSpaceWC,
      this.rooms})
      : super(
          name: workSpaceName,
          hallImages: workSpaceImages,
          category: 'WorkSpace',
          location: workSpaceLocation,
          rating: workSpaceRatnig,
          address: address,
          wifi: workSpacewifi,
          WC: workSpaceWC,
        ) {
    this.namedProperty.remove('Price per hour');
  }
}
