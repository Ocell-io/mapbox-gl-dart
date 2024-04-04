@JS('mapboxgl')
library mapboxgl.interop.ui.handler.drag_rotate;

import 'dart:js_interop';

import 'package:web/web.dart';

@JS()
@anonymous
extension type DragRotateHandlerJsImpl._(JSObject _) implements JSObject {
  ///  Returns a Boolean indicating whether the "drag to rotate" interaction is enabled.
  ///
  ///  @returns {boolean} `true` if the "drag to rotate" interaction is enabled.
  external bool isEnabled();

  ///  Returns a Boolean indicating whether the "drag to rotate" interaction is active, i.e. currently being used.
  ///
  ///  @returns {boolean} `true` if the "drag to rotate" interaction is active.
  external bool isActive();

  ///  Enables the "drag to rotate" interaction.
  ///
  ///  @example
  ///  map.dragRotate.enable();
  external void enable();

  ///  Disables the "drag to rotate" interaction.
  ///
  ///  @example
  ///  map.dragRotate.disable();
  external void disable();

  external void onMouseDown(MouseEvent e);
}
