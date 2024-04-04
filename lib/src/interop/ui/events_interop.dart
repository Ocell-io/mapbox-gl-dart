@JS('mapboxgl')
library mapboxgl.interop.ui.events;

import 'package:web/web.dart';
import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type MapMouseEventJsImpl._(JSObject _) implements JSObject {
  /// The event type.
  external String type;

  /// The `MapboxMap` object that fired the event.
  external MapboxMapJsImpl target;

  /// The DOM event which caused the map event.
  external MouseEvent originalEvent;

  /// The pixel coordinates of the mouse cursor, relative to the map and measured from the top left corner.
  external PointJsImpl point;

  /// The geographic location on the map of the mouse cursor.
  external LngLatJsImpl lngLat;

  ///  Prevents subsequent default processing of the event by the map.
  ///
  ///  Calling this method will prevent the following default map behaviors:
  ///
  ///  *  On `mousedown` events, the behavior of {@link DragPanHandler}
  ///  *  On `mousedown` events, the behavior of {@link DragRotateHandler}
  ///  *  On `mousedown` events, the behavior of {@link BoxZoomHandler}
  ///  *  On `dblclick` events, the behavior of {@link DoubleClickZoomHandler}
  external void preventDefault();

  /// `true` if `preventDefault` has been called.
  external bool defaultPrevented;
}

@JS()
@anonymous
extension type MapTouchEventJsImpl._(JSObject _) implements JSObject {
  /// The event type.
  external String type;

  /// The `MapboxMap` object that fired the event.
  external MapboxMapJsImpl target;

  /// The DOM event which caused the map event.
  external TouchEvent originalEvent;

  /// The geographic location on the map of the center of the touch event points.
  external LngLatJsImpl lngLat;

  /// The pixel coordinates of the center of the touch event points, relative to the map and measured from the top left
  /// corner.
  external PointJsImpl point;

  ///  The array of pixel coordinates corresponding to a
  ///  [touch event's `touches`](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent/touches) property.
  external JSArray<PointJsImpl> points;

  ///  The geographical locations on the map corresponding to a
  ///  [touch event's `touches`](https://developer.mozilla.org/en-US/docs/Web/API/TouchEvent/touches) property.
  external JSArray<LngLatJsImpl> lngLats;

  ///  Prevents subsequent default processing of the event by the map.
  ///
  ///  Calling this method will prevent the following default map behaviors:
  ///
  ///  *  On `touchstart` events, the behavior of {@link DragPanHandler}
  ///  *  On `touchstart` events, the behavior of {@link TouchZoomRotateHandler}
  external void preventDefault();

  ///  `true` if `preventDefault` has been called.
  external bool defaultPrevented;
}
