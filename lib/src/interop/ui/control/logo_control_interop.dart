@JS('mapboxgl')
library mapboxgl.interop.ui.control.logo_control;

import 'dart:js_interop';
import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:web/web.dart';

/// A `LogoControl` is a control that adds the Mapbox watermark
/// to the map as required by the [terms of service](https://www.mapbox.com/tos/) for Mapbox
/// vector tiles and core styles.
///
/// @implements {IControl}
/// @private
@JS('LogoControl')
extension type LogoControlJsImpl._(JSObject _) implements JSObject {
  external factory LogoControlJsImpl();

  external HTMLElement onAdd(MapboxMapJsImpl map);

  external void onRemove();

  external String getDefaultPosition();
}
