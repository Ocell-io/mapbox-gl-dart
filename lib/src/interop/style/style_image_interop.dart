@JS('mapboxgl')
library mapboxgl.interop.style.style_image;

import 'dart:js_interop';

@JS()
@anonymous
extension type StyleImageJsImpl._(JSObject _) implements JSObject {
  external JSAny data;
  external num pixelRatio;
  external bool sdf;
  external num version;
  external bool hasRenderCallback;
  external StyleImageInterfaceJsImpl userImage;
}

@JS()
@anonymous
extension type StyleImageInterfaceJsImpl._(JSObject _) implements JSObject {
  external num width;
  external num height;
  external JSAny data;
  external JSFunction render;
  external JSFunction onAdd;
  external JSFunction onRemove;
}
