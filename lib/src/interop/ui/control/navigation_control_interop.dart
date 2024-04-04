@JS('mapboxgl')
library mapboxgl.interop.ui.control.navigation_control;

import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';

@JS()
@anonymous
extension type NavigationControlOptionsJsImpl._(JSObject _)
    implements JSObject {
  external bool get showCompass;
  external bool get showZoom;
  external bool get visualizePitch;

  external factory NavigationControlOptionsJsImpl({
    bool? showCompass,
    bool? showZoom,
    bool? visualizePitch,
  });
}

/// A `NavigationControl` control contains zoom buttons and a compass.
///
/// @implements {IControl}
/// @param {Object} [options]
/// @param {Boolean} [options.showCompass=true] If `true` the compass button is included.
/// @param {Boolean} [options.showZoom=true] If `true` the zoom-in and zoom-out buttons are included.
/// @param {Boolean} [options.visualizePitch=false] If `true` the pitch is visualized by rotating X-axis of compass.
/// @example
/// var nav = new mapboxgl.NavigationControl();
/// map.addControl(nav, 'top-left');
/// @see [Display map navigation controls](https://www.mapbox.com/mapbox-gl-js/example/navigation/)
/// @see [Add a third party vector tile source](https://www.mapbox.com/mapbox-gl-js/example/third-party/)
@JS('NavigationControl')
extension type NavigationControlJsImpl._(JSObject _) implements JSObject {
  external NavigationControlOptionsJsImpl get options;

  external factory NavigationControlJsImpl(
      NavigationControlOptionsJsImpl options);

  external void onAdd(MapboxMapJsImpl map);

  external void onRemove();
}
