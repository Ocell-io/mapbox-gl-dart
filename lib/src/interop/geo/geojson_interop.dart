@JS('mapboxgl')
library mapboxgl.interop.geo.geojson;

import 'dart:js_interop';

@JS()
@anonymous
extension type FeatureCollectionJsImpl._(JSObject _) implements JSObject {
  external String type;
  external JSArray<FeatureJsImpl> features;
  external factory FeatureCollectionJsImpl({
    String type,
    JSArray<FeatureJsImpl> features,
  });
}

@JS()
@anonymous
extension type FeatureJsImpl._(JSObject _) implements JSObject {
  external num id;
  external String type;
  external GeometryJsImpl geometry;
  external JSAny properties;
  external String source;
  external factory FeatureJsImpl({
    num id,
    String? type,
    GeometryJsImpl geometry,
    JSAny properties,
    String? source,
  });
}

@JS()
@anonymous
extension type GeometryJsImpl._(JSObject _) implements JSObject {
  external String type;
  external JSAny coordinates;
  external factory GeometryJsImpl({
    String? type,
    JSAny coordinates,
  });
}
