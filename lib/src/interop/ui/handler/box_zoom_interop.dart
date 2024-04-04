@JS('mapboxgl')
library mapboxgl.interop.ui.handler.box_zoom;

import 'dart:js_interop';

import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart';

@JS()
@anonymous
extension type BoxZoomHandlerJsImpl._(JSObject obj) implements JSObject {
  ///  Returns a Boolean indicating whether the "box zoom" interaction is enabled.
  ///
  ///  @returns {boolean} `true` if the "box zoom" interaction is enabled.
  external bool isEnabled();

  ///  Returns a Boolean indicating whether the "box zoom" interaction is active, i.e. currently being used.
  ///
  ///  @returns {boolean} `true` if the "box zoom" interaction is active.
  external bool isActive();

  ///  Enables the "box zoom" interaction.
  ///
  ///  @example
  ///    map.boxZoom.enable();
  external void enable();

  ///  Disables the "box zoom" interaction.
  ///
  ///  @example
  ///    map.boxZoom.disable();
  external void disable();

  external void onmousedown(MouseEvent e, [PointJsImpl? point]);
}
