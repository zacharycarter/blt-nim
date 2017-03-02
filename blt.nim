 {.deadCodeElim: on.}
when defined(windows):
  const
    libname* = "libbearlibterminal.dll"
elif defined(macosx):
  const
    libname* = "libbearlibterminal.dylib"
else:
  const
    libname* = "libbearlibterminal.so"

const TK_CLOSE* =           0xE0
const TK_RESIZED* =         0xE1
const TK_ALIGN_DEFAULT* =   0x0
const TK_ALIGN_RIGHT* =     0x2
const TK_ESCAPE* =          0x29

type
  color_t* = uint32
  dimensions_t* = object
    width*: cint
    height*: cint


proc terminal_open*(): cint {.cdecl, importc: "terminal_open", dynlib: libname.}
proc terminal_close*() {.cdecl, importc: "terminal_close", dynlib: libname.}
proc terminal_set8*(value: ptr int8): cint {.cdecl, importc: "terminal_set8",
                                        dynlib: libname.}
proc terminal_set16*(value: ptr int16): cint {.cdecl, importc: "terminal_set16",
    dynlib: libname.}
proc terminal_set32*(value: ptr int32): cint {.cdecl, importc: "terminal_set32",
    dynlib: libname.}
proc terminal_refresh*() {.cdecl, importc: "terminal_refresh", dynlib: libname.}
proc terminal_clear*() {.cdecl, importc: "terminal_clear", dynlib: libname.}
proc terminal_clear_area*(x: cint; y: cint; w: cint; h: cint) {.cdecl,
    importc: "terminal_clear_area", dynlib: libname.}
proc terminal_crop*(x: cint; y: cint; w: cint; h: cint) {.cdecl, importc: "terminal_crop",
    dynlib: libname.}
proc terminal_layer*(index: cint) {.cdecl, importc: "terminal_layer", dynlib: libname.}
proc terminal_color*(color: color_t) {.cdecl, importc: "terminal_color",
                                    dynlib: libname.}
proc terminal_bkcolor*(color: color_t) {.cdecl, importc: "terminal_bkcolor",
                                      dynlib: libname.}
proc terminal_composition*(mode: cint) {.cdecl, importc: "terminal_composition",
                                      dynlib: libname.}
proc terminal_put*(x: cint; y: cint; code: cint) {.cdecl, importc: "terminal_put",
    dynlib: libname.}
proc terminal_put_ext*(x: cint; y: cint; dx: cint; dy: cint; code: cint;
                      corners: ptr color_t) {.cdecl, importc: "terminal_put_ext",
    dynlib: libname.}
proc terminal_pick*(x: cint; y: cint; index: cint): cint {.cdecl,
    importc: "terminal_pick", dynlib: libname.}
proc terminal_pick_color*(x: cint; y: cint; index: cint): color_t {.cdecl,
    importc: "terminal_pick_color", dynlib: libname.}
proc terminal_pick_bkcolor*(x: cint; y: cint): color_t {.cdecl,
    importc: "terminal_pick_bkcolor", dynlib: libname.}
proc terminal_print_ext8*(x: cint; y: cint; w: cint; h: cint; align: cint; s: ptr int8;
                         out_w: ptr cint; out_h: ptr cint) {.cdecl,
    importc: "terminal_print_ext8", dynlib: libname.}
proc terminal_print_ext16*(x: cint; y: cint; w: cint; h: cint; align: cint; s: ptr int16;
                          out_w: ptr cint; out_h: ptr cint) {.cdecl,
    importc: "terminal_print_ext16", dynlib: libname.}
proc terminal_print_ext32*(x: cint; y: cint; w: cint; h: cint; align: cint; s: ptr int32;
                          out_w: ptr cint; out_h: ptr cint) {.cdecl,
    importc: "terminal_print_ext32", dynlib: libname.}
proc terminal_measure_ext8*(w: cint; h: cint; s: ptr int8; out_w: ptr cint; out_h: ptr cint) {.
    cdecl, importc: "terminal_measure_ext8", dynlib: libname.}
proc terminal_measure_ext16*(w: cint; h: cint; s: ptr int16; out_w: ptr cint;
                            out_h: ptr cint) {.cdecl,
    importc: "terminal_measure_ext16", dynlib: libname.}
proc terminal_measure_ext32*(w: cint; h: cint; s: ptr int32; out_w: ptr cint;
                            out_h: ptr cint) {.cdecl,
    importc: "terminal_measure_ext32", dynlib: libname.}
proc terminal_has_input*(): cint {.cdecl, importc: "terminal_has_input",
                                dynlib: libname.}
proc terminal_state*(code: cint): cint {.cdecl, importc: "terminal_state",
                                     dynlib: libname.}
proc terminal_read*(): cint {.cdecl, importc: "terminal_read", dynlib: libname.}
proc terminal_read_str8*(x: cint; y: cint; buffer: ptr int8; max: cint): cint {.cdecl,
    importc: "terminal_read_str8", dynlib: libname.}
proc terminal_read_str16*(x: cint; y: cint; buffer: ptr int16; max: cint): cint {.cdecl,
    importc: "terminal_read_str16", dynlib: libname.}
proc terminal_read_str32*(x: cint; y: cint; buffer: ptr int32; max: cint): cint {.cdecl,
    importc: "terminal_read_str32", dynlib: libname.}
proc terminal_peek*(): cint {.cdecl, importc: "terminal_peek", dynlib: libname.}
proc terminal_delay*(period: cint) {.cdecl, importc: "terminal_delay", dynlib: libname.}
proc terminal_get8*(key: ptr int8; def: ptr int8): ptr int8 {.cdecl,
    importc: "terminal_get8", dynlib: libname.}
proc terminal_get16*(key: ptr int16; def: ptr int16): ptr int16 {.cdecl,
    importc: "terminal_get16", dynlib: libname.}
proc terminal_get32*(key: ptr int32; def: ptr int32): ptr int32 {.cdecl,
    importc: "terminal_get32", dynlib: libname.}
proc color_from_name8*(name: ptr int8): color_t {.cdecl, importc: "color_from_name8",
    dynlib: libname.}
proc color_from_name16*(name: ptr int16): color_t {.cdecl,
    importc: "color_from_name16", dynlib: libname.}
proc color_from_name32*(name: ptr int32): color_t {.cdecl,
    importc: "color_from_name32", dynlib: libname.}

import strutils

proc terminal_set*(s: cstring): cint {.inline.} =
  return terminal_set8(cast[ptr int8](s))

proc terminal_setf*(s: string, args: varargs[string, `$`]) : cint =
  var ret : cint
  ret = terminal_set(format(s, args))

proc terminal_print_ext*(x,y,w,h: cint, alignment: cint, s: cstring) : dimensions_t =
  var ret : dimensions_t
  terminal_print_ext8(x, y, w, h, alignment, cast[ptr int8](s), addr(ret.width), addr(ret.height))
  return ret

proc terminal_print*(x: cint; y: cint; s: cstring): dimensions_t {.inline.} =
  return terminal_print_ext(x, y, 0, 0, TK_ALIGN_DEFAULT, s)

proc terminal_printf*(x, y: cint, s: string, args: varargs[string, `$`]) : dimensions_t =
  var ret : dimensions_t
  ret = terminal_print(x, y, format(s, args))
  return ret

proc terminal_printf_ext*(x, y, w, h: cint, align: cint, s: string, args: varargs[string, `$`]) : dimensions_t =
  var ret : dimensions_t
  ret = terminal_print_ext(x, y, w, h, align, format(s, args))
  return ret

proc terminal_measure_ext*(w,h: cint, s: cstring) : dimensions_t =
  var ret : dimensions_t
  terminal_measure_ext8(w, h, cast[ptr int8](s), addr(ret.width), addr(ret.height))

proc terminal_measure*(s: cstring) : dimensions_t {.inline.} =
  echo repr s
  return terminal_measure_ext(0, 0, s)

proc terminal_measuref*(s: string, args: varargs[string, `$`]) : dimensions_t =
  var ret: dimensions_t
  ret = terminal_measure(format(s, args))
  return ret

proc terminal_read_str*(x: cint; y: cint; buffer: cstring; max: cint): cint {.inline.} =
  return terminal_read_str8(x, y, cast[ptr int8](buffer), max)

proc terminal_get*(key: cstring; default: cstring = cast[cstring](0)): cstring {.inline.} =
  return cast[cstring](terminal_get8(cast[ptr int8](key),
                                    cast[ptr int8](default)))

proc color_from_name*(name: cstring): color_t {.inline.} =
  return color_from_name8(cast[ptr int8](name))

proc color_from_argb*(a: int; r: int; g: int; b: int): int {.inline.} =
  let ret = ((a shl 24) or (r shl 16) or (g shl 8) or b)
  echo repr ret
  ret

proc terminal_check*(code: cint): cint {.inline.} =
  return cint terminal_state(code) > 0