library mapboxgl.util.evented;

import 'dart:js_interop';

import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

typedef Listener = dynamic Function(Event object);
typedef GeoListener = JSAny Function(JSAny object);

class Event extends JsObjectWrapper<EventJsImpl> {
  String? get id => jsObject.id;
  String get type => jsObject.type;
  LngLat get lngLat => LngLat.fromJsObject(jsObject.lngLat);
  List<Feature> get features =>
      jsObject.features?.toDart
          .map((dynamic f) => Feature.fromJsObject(f))
          .toList() ??
      [];
  Point get point => Point.fromJsObject(jsObject.point);

  factory Event({
    String? id,
    String? type,
    required LngLat lngLat,
    required List<Feature> features,
    required Point point,
  }) =>
      Event.fromJsObject(EventJsImpl(
        id: id?.toJS,
        type: type?.toJS,
        lngLat: lngLat.jsObject,
        features: features.map((Feature f) => f.jsObject).toList().toJS,
        point: point.jsObject,
      ));

  preventDefault() => jsObject.preventDefault();

  /// Creates a new Event from a [jsObject].
  Event.fromJsObject(EventJsImpl jsObject) : super.fromJsObject(jsObject);
}

class Evented extends JsObjectWrapper<EventedJsImpl> {
  ///  Adds a listener to a specified event type.
  ///
  ///  @param {string} type The event type to add a listen for.
  ///  @param {Function} listener The function to be called when the event is fired.
  ///    The listener function is called with the data object passed to `fire`,
  ///    extended with `target` and `type` properties.
  ///  @returns {Object} `this`
  MapboxMap on(String type, [dynamic layerIdOrListener, Listener? listener]) {
    if (this is GeolocateControl && layerIdOrListener is GeoListener) {
      return MapboxMap.fromJsObject(
        jsObject.on(type, layerIdOrListener.toJS),
      );
    }
    if (layerIdOrListener is Listener) {
      return MapboxMap.fromJsObject(
        jsObject.on(
          type,
          (EventJsImpl object) {
            layerIdOrListener(Event.fromJsObject(object));
          }.toJS,
        ),
      );
    }

    if (layerIdOrListener is String && listener != null) {
      return MapboxMap.fromJsObject(jsObject.on(
        type,
        layerIdOrListener.toJS,
        (EventJsImpl object) {
          listener(Event.fromJsObject(object));
        }.toJS,
      ));
    }
    return MapboxMap.fromJsObject(jsObject as MapboxMapJsImpl);
  }

  ///  Removes a previously registered event listener.
  ///
  ///  @param {string} type The event type to remove listeners for.
  ///  @param {Function} listener The listener function to remove.
  ///  @returns {Object} `this`
  MapboxMap off(String type, [dynamic layerIdOrListener, Listener? listener]) {
    if (layerIdOrListener is Listener) {
      return MapboxMap.fromJsObject(
        jsObject.off(
          type,
          (EventJsImpl object) {
            layerIdOrListener(Event.fromJsObject(object));
          }.toJS,
        ),
      );
    }
    return MapboxMap.fromJsObject(jsObject.off(
      type,
      layerIdOrListener,
      (EventJsImpl object) {
        listener!(Event.fromJsObject(object));
      }.toJS,
    ));
  }

  ///  Adds a listener that will be called only once to a specified event type.
  ///
  ///  The listener will be called first time the event fires after the listener is registered.
  ///
  ///  @param {string} type The event type to listen for.
  ///  @param {Function} listener The function to be called when the event is fired the first time.
  ///  @returns {Object} `this`
  MapboxMap once(String type, Listener listener) =>
      MapboxMap.fromJsObject(jsObject.once(
        type,
        (EventJsImpl object) {
          listener(Event.fromJsObject(object));
        }.toJS,
      ));

  fire(Event event, [dynamic properties]) =>
      jsObject.fire(event.jsObject, properties);

  ///  Returns a true if this instance of Evented or any forwardeed instances of Evented have a listener for the specified type.
  ///
  ///  @param {string} type The event type
  ///  @returns {boolean} `true` if there is at least one registered listener for specified event type, `false` otherwise
  ///  @private
  listens(String type) => jsObject.listens(type);

  ///  Bubble all events fired by this instance of Evented to this parent instance of Evented.
  ///
  ///  @private
  ///  @returns {Object} `this`
  ///  @private
  setEventedParent([Evented? parent, dynamic data]) =>
      jsObject.setEventedParent(parent?.jsObject, data);

  /// Creates a new Evented from a [jsObject].
  Evented.fromJsObject(EventedJsImpl jsObject) : super.fromJsObject(jsObject);
}
