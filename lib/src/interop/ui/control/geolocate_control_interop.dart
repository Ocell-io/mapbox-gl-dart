@JS('mapboxgl')
library mapboxgl.interop.ui.control.geolocate_control;

import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type GeolocateControlOptionsJsImpl._(JSObject _) implements JSObject {
  external PositionOptionsJsImpl get positionOptions;
  external JSAny get fitBoundsOptions;
  external bool get trackUserLocation;
  external bool get showAccuracyCircle;
  external bool get showUserLocation;

  external factory GeolocateControlOptionsJsImpl({
    PositionOptionsJsImpl? positionOptions,
    JSAny fitBoundsOptions,
    bool? trackUserLocation,
    bool? showAccuracyCircle,
    bool? showUserLocation,
  });
}

@JS('Foo')
extension type FooJS._(JSObject _) implements JSObject {
  external void baz(JSFunction callback);
}

class Foo {
  final FooJS fooJs;

  Foo({required this.fooJs});
  void baz(Function(String e) callback) => fooJs.baz(callback.toJS);
}

@JS()
@anonymous
extension type PositionOptionsJsImpl._(JSObject _) implements JSObject {
  external bool enableHighAccuracy;
  external num maximumAge;
  external num timeout;

  external factory PositionOptionsJsImpl({
    bool? enableHighAccuracy,
    num? maximumAge,
    num? timeout,
  });
}

@JS('GeolocateControl')
extension type GeolocateControlJsImpl._(EventedJsImpl _)
    implements EventedJsImpl {
  external GeolocateControlOptionsJsImpl get options;

  external factory GeolocateControlJsImpl(
      GeolocateControlOptionsJsImpl options);

  external void onAdd(MapboxMapJsImpl map);

  external void onRemove(MapboxMapJsImpl map);

  external void trigger();
}
