@JS('mapboxgl')
library mapboxgl.interop.ui.handler.drag_pan;

import 'dart:js_interop';

@JS()
@anonymous
extension type DragPanHandlerJsImpl._(JSObject _) implements JSObject {
  ///  Returns a Boolean indicating whether the "drag to pan" interaction is enabled.
  ///
  ///  @returns {boolean} `true` if the "drag to pan" interaction is enabled.
  external bool isEnabled();

  ///  Returns a Boolean indicating whether the "drag to pan" interaction is active, i.e. currently being used.
  ///
  ///  @returns {boolean} `true` if the "drag to pan" interaction is active.
  external bool isActive();

  ///  Enables the "drag to pan" interaction.
  ///
  ///  @example
  ///  map.dragPan.enable();
  external void enable();

  ///  Disables the "drag to pan" interaction.
  ///
  ///  @example
  ///  map.dragPan.disable();
  external void disable();
}
