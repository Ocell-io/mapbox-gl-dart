library mapboxgl.geo.geojson;

import 'dart:js_interop';

import 'package:js/js_util.dart';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

class FeatureCollection extends JsObjectWrapper<FeatureCollectionJsImpl> {
  String get type => jsObject.type;
  List<Feature> get features =>
      jsObject.features.toDart.map((f) => Feature.fromJsObject(f)).toList();

  factory FeatureCollection({
    required List<Feature> features,
  }) {
    return FeatureCollection.fromJsObject(FeatureCollectionJsImpl(
      type: 'FeatureCollection',
      features: features.map((f) => f.jsObject).toList().toJS,
    ));
  }

  /// Creates a new FeatureCollection from a [jsObject].
  FeatureCollection.fromJsObject(FeatureCollectionJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

class Feature extends JsObjectWrapper<FeatureJsImpl> {
  num get id => jsObject.id;
  set id(num id) {
    jsObject.id = id;
  }

  String get type => jsObject.type;
  Geometry get geometry => Geometry.fromJsObject(jsObject.geometry);
  Map<String, dynamic> get properties {
    final converted = jsObject.properties.dartify();
    if (converted == null || converted is! Map<String, dynamic>) {
      return {};
    }
    return converted;
  }

  String get source => jsObject.source;

  factory Feature({
    num? id,
    required Geometry geometry,
    Map<String, dynamic>? properties,
    String? source,
  }) =>
      Feature.fromJsObject(FeatureJsImpl(
        type: 'Feature',
        id: id ?? 0,
        geometry: geometry.jsObject,
        properties: properties == null
            ? jsify({})
            : jsify(properties), // TODO: Remove jsify
        source: source,
      ));

  Feature copyWith({
    num? id,
    Geometry? geometry,
    Map<String, dynamic>? properties,
    String? source,
  }) =>
      Feature.fromJsObject(FeatureJsImpl(
        type: 'Feature',
        id: id ?? this.id,
        geometry: geometry != null ? geometry.jsObject : this.geometry.jsObject,
        properties: properties != null
            ? jsify(properties)
            : jsify(this.properties), // TODO: Remove jsify
        source: source ?? this.source,
      ));

  /// Creates a new Feature from a [jsObject].
  Feature.fromJsObject(FeatureJsImpl jsObject) : super.fromJsObject(jsObject);
}

class Geometry extends JsObjectWrapper<GeometryJsImpl> {
  String get type => jsObject.type;
  dynamic get coordinates => jsObject.coordinates;

  factory Geometry({
    String? type,
    dynamic coordinates,
  }) =>
      Geometry.fromJsObject(GeometryJsImpl(
        type: type,
        coordinates: coordinates,
      ));

  /// Creates a new Geometry from a [jsObject].
  Geometry.fromJsObject(GeometryJsImpl jsObject) : super.fromJsObject(jsObject);
}
