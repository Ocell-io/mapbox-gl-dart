@JS('mapboxgl')
library mapboxgl.style.interop.sources.vector_source;

import 'dart:js_interop';

@JS()
@anonymous
extension type VectorSourceJsImpl._(JSObject _) implements JSObject {
  external String get url;
  external JSArray<JSString> get tiles;
  external factory VectorSourceJsImpl({
    String? type,
    String? url,
    JSArray<JSString>? tiles,
  });
}
