@JS('mapboxgl')
library mapboxgl.interop.util.evented;

import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type EventJsImpl._(JSObject _) implements JSObject {
  external String get id;
  external String get type;
  external LngLatJsImpl get lngLat;
  external JSArray<FeatureJsImpl> get features;
  external PointJsImpl get point;

  external factory EventJsImpl({
    String? id,
    String? type,
    LngLatJsImpl? lngLat,
    JSArray<FeatureJsImpl?>? features,
    PointJsImpl? point,
  });

  external void preventDefault();
}

@JS('Evented')
extension type EventedJsImpl._(JSObject _) implements JSObject {
  ///  Adds a listener to a specified event type.
  ///
  ///  @param {string} type The event type to add a listen for.
  ///  @param {Function} listener The function to be called when the event is fired.
  ///    The listener function is called with the data object passed to `fire`,
  ///    extended with `target` and `type` properties.
  ///  @returns {Object} `this`
  //external on(String type, Listener listener);
  external MapboxMapJsImpl on(String type,
      [JSAny layerIdOrListener, JSFunction? listener]);

  ///  Removes a previously registered event listener.
  ///
  ///  @param {string} type The event type to remove listeners for.
  ///  @param {Function} listener The listener function to remove.
  ///  @returns {Object} `this`
  //external off(String type, Listener listener);
  external MapboxMapJsImpl off(String type,
      [JSAny layerIdOrListener, JSFunction? listener]);

  ///  Adds a listener that will be called only once to a specified event type.
  ///
  ///  The listener will be called first time the event fires after the listener is registered.
  ///
  ///  @param {string} type The event type to listen for.
  ///  @param {Function} listener The function to be called when the event is fired the first time.
  ///  @returns {Object} `this`
  external MapboxMapJsImpl once(String type, JSFunction listener);

  external void fire(EventJsImpl event, [JSAny properties]);

  ///  Returns a true if this instance of Evented or any forwardeed instances of Evented have a listener for the specified type.
  ///
  ///  @param {string} type The event type
  ///  @returns {boolean} `true` if there is at least one registered listener for specified event type, `false` otherwise
  ///  @private
  external bool listens(String type);

  ///  Bubble all events fired by this instance of Evented to this parent instance of Evented.
  ///
  ///  @private
  ///  @returns {Object} `this`
  ///  @private
  external EventedJsImpl setEventedParent([EventedJsImpl? parent, JSAny data]);
}
