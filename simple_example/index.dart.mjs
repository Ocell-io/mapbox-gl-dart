let buildArgsList;

// `modulePromise` is a promise to the `WebAssembly.module` object to be
//   instantiated.
// `importObjectPromise` is a promise to an object that contains any additional
//   imports needed by the module that aren't provided by the standard runtime.
//   The fields on this object will be merged into the importObject with which
//   the module will be instantiated.
// This function returns a promise to the instantiated module.
export const instantiate = async (modulePromise, importObjectPromise) => {
    let dartInstance;

    function stringFromDartString(string) {
        const totalLength = dartInstance.exports.$stringLength(string);
        let result = '';
        let index = 0;
        while (index < totalLength) {
          let chunkLength = Math.min(totalLength - index, 0xFFFF);
          const array = new Array(chunkLength);
          for (let i = 0; i < chunkLength; i++) {
              array[i] = dartInstance.exports.$stringRead(string, index++);
          }
          result += String.fromCharCode(...array);
        }
        return result;
    }

    function stringToDartString(string) {
        const length = string.length;
        let range = 0;
        for (let i = 0; i < length; i++) {
            range |= string.codePointAt(i);
        }
        if (range < 256) {
            const dartString = dartInstance.exports.$stringAllocate1(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite1(dartString, i, string.codePointAt(i));
            }
            return dartString;
        } else {
            const dartString = dartInstance.exports.$stringAllocate2(length);
            for (let i = 0; i < length; i++) {
                dartInstance.exports.$stringWrite2(dartString, i, string.charCodeAt(i));
            }
            return dartString;
        }
    }

    // Prints to the console
    function printToConsole(value) {
      if (typeof dartPrint == "function") {
        dartPrint(value);
        return;
      }
      if (typeof console == "object" && typeof console.log != "undefined") {
        console.log(value);
        return;
      }
      if (typeof print == "function") {
        print(value);
        return;
      }

      throw "Unable to print message: " + js;
    }

    // Converts a Dart List to a JS array. Any Dart objects will be converted, but
    // this will be cheap for JSValues.
    function arrayFromDartList(constructor, list) {
        const length = dartInstance.exports.$listLength(list);
        const array = new constructor(length);
        for (let i = 0; i < length; i++) {
            array[i] = dartInstance.exports.$listRead(list, i);
        }
        return array;
    }

    buildArgsList = function(list) {
        const dartList = dartInstance.exports.$makeStringList();
        for (let i = 0; i < list.length; i++) {
            dartInstance.exports.$listAdd(dartList, stringToDartString(list[i]));
        }
        return dartList;
    }

    // A special symbol attached to functions that wrap Dart functions.
    const jsWrappedDartFunctionSymbol = Symbol("JSWrappedDartFunction");

    function finalizeWrapper(dartFunction, wrapped) {
        wrapped.dartFunction = dartFunction;
        wrapped[jsWrappedDartFunctionSymbol] = true;
        return wrapped;
    }

    // Imports
    const dart2wasm = {

_76: x0 => new mapboxgl.Popup(x0),
_77: (x0,x1) => x0.addTo(x1),
_80: x0 => x0.remove(),
_83: (x0,x1) => x0.setLngLat(x1),
_88: (x0,x1) => x0.setHTML(x1),
_98: (x0,x1,x2,x3,x4,x5,x6) => ({loseButton: x0,closeButton: x1,closeOnClick: x2,anchor: x3,offset: x4,className: x5,maxWidth: x6}),
_101: x0 => x0.lngLat,
_102: x0 => x0.features,
_106: (x0,x1,x2,x3) => x0.on(x1,x2,x3),
_139: x0 => new mapboxgl.Map(x0),
_186: (x0,x1,x2) => x0.addSource(x1,x2),
_201: (x0,x1,x2) => x0.addLayer(x1,x2),
_220: x0 => x0.getCanvas(),
_494: x0 => x0.lng,
_498: (x0,x1) => new mapboxgl.LngLat(x0,x1),
_528: f => finalizeWrapper(f,x0 => dartInstance.exports._528(f,x0)),
_529: (x0,x1,x2) => x0.on(x1,x2),
_530: f => finalizeWrapper(f,x0 => dartInstance.exports._530(f,x0)),
_531: f => finalizeWrapper(f,x0 => dartInstance.exports._531(f,x0)),
_550: (x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,x32,x33,x34,x35,x36,x37,x38,x39,x40) => ({interactive: x0,container: x1,bearingSnap: x2,pitchWithRotate: x3,clickTolerance: x4,attributionControl: x5,customAttribution: x6,logoPosition: x7,failIfMajorPerformanceCaveat: x8,preserveDrawingBuffer: x9,antialias: x10,refreshExpiredTiles: x11,maxBounds: x12,scrollZoom: x13,minZoom: x14,maxZoom: x15,minPitch: x16,maxPitch: x17,style: x18,boxZoom: x19,dragRotate: x20,dragPan: x21,keyboard: x22,doubleClickZoom: x23,touchZoomRotate: x24,trackResize: x25,center: x26,zoom: x27,bearing: x28,pitch: x29,bounds: x30,fitBoundsOptions: x31,renderWorldCopies: x32,maxTileCacheSize: x33,localIdeographFontFamily: x34,transformRequest: x35,collectResourceTiming: x36,fadeDuration: x37,crossSourceCollisions: x38,accessToken: x39,locale: x40}),
_750: x0 => x0.style,
_10953: (x0,x1) => x0.cursor = x1,
_13329: x0 => x0.geometry,
_13331: x0 => x0.properties,
_13337: x0 => x0.coordinates,
_13342: v => stringToDartString(v.toString()),
_13357: () => {
          let stackString = new Error().stack.toString();
          let frames = stackString.split('\n');
          let drop = 2;
          if (frames[0] === 'Error') {
              drop += 1;
          }
          return frames.slice(drop).join('\n');
        },
_13366: s => stringToDartString(JSON.stringify(stringFromDartString(s))),
_13367: s => printToConsole(stringFromDartString(s)),
_13380: o => Object.keys(o),
_13385: (c) =>
              queueMicrotask(() => dartInstance.exports.$invokeCallback(c)),
_13387: (a, i) => a.push(i),
_13398: a => a.length,
_13400: (a, i) => a[i],
_13401: (a, i, v) => a[i] = v,
_13403: a => a.join(''),
_13413: (s, p, i) => s.indexOf(p, i),
_13416: (o, start, length) => new Uint8Array(o.buffer, o.byteOffset + start, length),
_13417: (o, start, length) => new Int8Array(o.buffer, o.byteOffset + start, length),
_13418: (o, start, length) => new Uint8ClampedArray(o.buffer, o.byteOffset + start, length),
_13419: (o, start, length) => new Uint16Array(o.buffer, o.byteOffset + start, length),
_13420: (o, start, length) => new Int16Array(o.buffer, o.byteOffset + start, length),
_13421: (o, start, length) => new Uint32Array(o.buffer, o.byteOffset + start, length),
_13422: (o, start, length) => new Int32Array(o.buffer, o.byteOffset + start, length),
_13425: (o, start, length) => new Float32Array(o.buffer, o.byteOffset + start, length),
_13426: (o, start, length) => new Float64Array(o.buffer, o.byteOffset + start, length),
_13430: (o) => new DataView(o.buffer, o.byteOffset, o.byteLength),
_13434: Function.prototype.call.bind(Object.getOwnPropertyDescriptor(DataView.prototype, 'byteLength').get),
_13435: (b, o) => new DataView(b, o),
_13437: Function.prototype.call.bind(DataView.prototype.getUint8),
_13439: Function.prototype.call.bind(DataView.prototype.getInt8),
_13441: Function.prototype.call.bind(DataView.prototype.getUint16),
_13443: Function.prototype.call.bind(DataView.prototype.getInt16),
_13445: Function.prototype.call.bind(DataView.prototype.getUint32),
_13447: Function.prototype.call.bind(DataView.prototype.getInt32),
_13453: Function.prototype.call.bind(DataView.prototype.getFloat32),
_13455: Function.prototype.call.bind(DataView.prototype.getFloat64),
_13476: o => o === undefined,
_13477: o => typeof o === 'boolean',
_13478: o => typeof o === 'number',
_13480: o => typeof o === 'string',
_13483: o => o instanceof Int8Array,
_13484: o => o instanceof Uint8Array,
_13485: o => o instanceof Uint8ClampedArray,
_13486: o => o instanceof Int16Array,
_13487: o => o instanceof Uint16Array,
_13488: o => o instanceof Int32Array,
_13489: o => o instanceof Uint32Array,
_13490: o => o instanceof Float32Array,
_13491: o => o instanceof Float64Array,
_13492: o => o instanceof ArrayBuffer,
_13493: o => o instanceof DataView,
_13494: o => o instanceof Array,
_13495: o => typeof o === 'function' && o[jsWrappedDartFunctionSymbol] === true,
_13497: o => {
            const proto = Object.getPrototypeOf(o);
            return proto === Object.prototype || proto === null;
          },
_13499: (l, r) => l === r,
_13500: o => o,
_13501: o => o,
_13502: o => o,
_13503: b => !!b,
_13504: o => o.length,
_13507: (o, i) => o[i],
_13508: f => f.dartFunction,
_13509: l => arrayFromDartList(Int8Array, l),
_13510: l => arrayFromDartList(Uint8Array, l),
_13511: l => arrayFromDartList(Uint8ClampedArray, l),
_13512: l => arrayFromDartList(Int16Array, l),
_13513: l => arrayFromDartList(Uint16Array, l),
_13514: l => arrayFromDartList(Int32Array, l),
_13515: l => arrayFromDartList(Uint32Array, l),
_13516: l => arrayFromDartList(Float32Array, l),
_13517: l => arrayFromDartList(Float64Array, l),
_13518: (data, length) => {
          const view = new DataView(new ArrayBuffer(length));
          for (let i = 0; i < length; i++) {
              view.setUint8(i, dartInstance.exports.$byteDataGetUint8(data, i));
          }
          return view;
        },
_13519: l => arrayFromDartList(Array, l),
_13520: stringFromDartString,
_13521: stringToDartString,
_13522: () => ({}),
_13523: () => [],
_13524: l => new Array(l),
_13528: (o, p) => o[p],
_13529: (o, p, v) => o[p] = v,
_13530: (o, m, a) => o[m].apply(o, a),
_13532: o => String(o),
_13556: x0 => globalThis.mapboxgl.accessToken = x0
    };

    const baseImports = {
        dart2wasm: dart2wasm,


        Math: Math,
        Date: Date,
        Object: Object,
        Array: Array,
        Reflect: Reflect,
    };

    const jsStringPolyfill = {
        "charCodeAt": (s, i) => s.charCodeAt(i),
        "compare": (s1, s2) => {
            if (s1 < s2) return -1;
            if (s1 > s2) return 1;
            return 0;
        },
        "concat": (s1, s2) => s1 + s2,
        "equals": (s1, s2) => s1 === s2,
        "fromCharCode": (i) => String.fromCharCode(i),
        "length": (s) => s.length,
        "substring": (s, a, b) => s.substring(a, b),
    };

    dartInstance = await WebAssembly.instantiate(await modulePromise, {
        ...baseImports,
        ...(await importObjectPromise),
        "wasm:js-string": jsStringPolyfill,
    });

    return dartInstance;
}

// Call the main function for the instantiated module
// `moduleInstance` is the instantiated dart2wasm module
// `args` are any arguments that should be passed into the main function.
export const invoke = (moduleInstance, ...args) => {
    const dartMain = moduleInstance.exports.$getMain();
    const dartArgs = buildArgsList(args);
    moduleInstance.exports.$invokeMain(dartMain, dartArgs);
}

