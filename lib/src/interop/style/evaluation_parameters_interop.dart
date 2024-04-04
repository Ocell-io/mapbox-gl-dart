@JS('mapboxgl')
library mapboxgl.interop.style.evaluation_parameters;

import 'dart:js_interop';

@JS('EvaluationParameters')
extension type EvaluationParametersJsImpl._(JSObject _) implements JSObject {
  external num zoom;
  external num now;
  external num fadeDuration;
  external JSAny zoomHistory;
  external JSAny transition;

  external factory EvaluationParametersJsImpl(num zoom, [JSAny options]);

  external bool isSupportedScript(String str);

  external void crossFadingFactor();

  external JSAny getCrossfadeParameters();
}
