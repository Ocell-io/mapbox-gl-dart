import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';

void main() {
  print("Hello, World!");
  print(Mapbox.version);

  Mapbox.accessToken =
      'pk.eyJ1Ijoib2NlbGwiLCJhIjoiY2pvdTE5bnhoMTc1cDNrcWlha2todGFkYiJ9.hW9Q853ix58dukevFHX1pw';

  MapboxMap(
    MapOptions(
      container: 'map',
      style: 'mapbox://styles/mapbox/dark-v10',
      center: LngLat(7.68227, 45.06755),
      zoom: 12,
    ),
  );
}
