import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';

void main() {
  Mapbox.accessToken =
      'pk.eyJ1IjoiYW5kcmVhNjg5IiwiYSI6ImNrNGlsYjhyZDBuYXoza213aWphOGNjZmoifQ.maw_5NsXejG1DoOeOi6hlQ';

  var map = MapboxMap(
    MapOptions(
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v11',
      center: LngLat(-77.04, 38.907),
      zoom: 11.15,
    ),
  );

  map.on('load', (_) {
    map.addSource('sourceId', {
      // This GeoJSON contains features that include an "icon"
      // property. The value of the "icon" property corresponds
      // to an image in the Mapbox Streets style's sprite.
      'type': 'geojson',
      'promoteId': 'id',
      'data': {
        'type': 'FeatureCollection',
        'features': [
          {
            'type': 'Feature',
            'properties': {
              'id': 'foo',
              'description':
                  r'<strong>Make it Mount Pleasant</strong><p><a href="http://www.mtpleasantdc.com/makeitmtpleasant" target="_blank" title="Opens in a new window">Make it Mount Pleasant</a> is a handmade and vintage market and afternoon of live entertainment and kids activities. 12:00-6:00 p.m.</p>',
              'icon': 'theatre'
            },
            'geometry': {
              'type': 'Point',
              'coordinates': [-77.038659, 38.931567]
            }
          },
          {
            'type': 'Feature',
            'properties': {
              'id': 42,
              'description':
                  r'<strong>Mad Men Season Five Finale Watch Party</strong><p>Head to Lounge 201 (201 Massachusetts Avenue NE) Sunday for a <a href="http://madmens5finale.eventbrite.com/" target="_blank" title="Opens in a new window">Mad Men Season Five Finale Watch Party</a>, complete with 60s costume contest, Mad Men trivia, and retro food and drink. 8:00-11:00 p.m. $10 general admission, $20 admission and two hour open bar.</p>',
              'icon': 'theatre'
            },
            'geometry': {
              'type': 'Point',
              'coordinates': [-77.003168, 38.894651]
            }
          }
        ]
      }
    });

    // Add a layer showing the places.
    var layer = SymbolLayer(
      id: 'places',
      source: 'sourceId',
      layout: SymbolLayout(
        iconImage: '{icon}-15',
        iconAllowOverlap: true,
      ),
    );
    map.addLayer(layer);

    // When a click event occurs on a feature in the places layer, open a popup at the
    // location of the feature, with description HTML from its properties.
    map.on('click', 'places', (e) {
      print(e.features[0].id);
      var coordinates = e.features[0].geometry.coordinates;
      var description = e.features[0].properties['description'];
      Popup()
          .setLngLat(LngLat(coordinates[0], coordinates[1]))
          .setHTML(description)
          .addTo(map);
    });

    // Change the cursor to a pointer when the mouse is over the places layer.
    map.on('mouseenter', 'places', (_) {
      map.getCanvas().style.cursor = 'pointer';
    });

    // Change it back to a pointer when it leaves.
    map.on('mouseleave', 'places', (_) {
      map.getCanvas().style.cursor = '';
    });
  });
}
