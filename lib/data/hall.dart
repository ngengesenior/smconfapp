import 'package:smconfapp/data/lat_lon.dart';

class Hall {
  final String name;
  final String id;
  final LatLong? location;

  const Hall(this.name, this.id, this.location);
}