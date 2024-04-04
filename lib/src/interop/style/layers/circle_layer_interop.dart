library mapboxgl.interop.style.layers.circle_layer;

import 'dart:js_interop';

import 'package:mapbox_gl_dart/mapbox_gl_dart.dart';

class CircleLayerJsImpl {
  static JSAny? toJs(CircleLayer circleLayer) => toDict(circleLayer).jsify();

  static Map<String, dynamic> toDict(CircleLayer circleLayer) {
    Map<String, dynamic> dict = {
      'id': circleLayer.id,
      'type': 'circle',
    };
    if (circleLayer.source != null) {
      dict['source'] = circleLayer.source is String
          ? circleLayer.source
          : circleLayer.source.dict;
    }
    if (circleLayer.sourceLayer != null) {
      dict['source-layer'] = circleLayer.sourceLayer;
    }
    if (circleLayer.paint != null) {
      dict['paint'] = circleLayer.paint!.dict;
    }
    return dict;
  }
}

class CirclePaintJsImpl {
  static JSAny? toJs(CirclePaint circlePaint) => toDict(circlePaint).jsify()!;

  static Map<String, dynamic> toDict(CirclePaint circlePaint) {
    Map<String, dynamic> dict = {};
    if (circlePaint.circleRadius != null) {
      dict['circle-radius'] = circlePaint.circleRadius;
    }
    if (circlePaint.circleColor != null) {
      dict['circle-color'] = circlePaint.circleColor;
    }
    return dict;
  }
}
