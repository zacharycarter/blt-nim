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

# Keyboard scancodes for events/states

const TK_A* =                0x04
const TK_B* =                0x05
const TK_C* =                0x06
const TK_D* =                0x07
const TK_E* =                0x08
const TK_F* =                0x09
const TK_G* =                0x0A
const TK_H* =                0x0B
const TK_I* =                0x0C
const TK_J* =                0x0D
const TK_K* =                0x0E
const TK_L* =                0x0F
const TK_M* =                0x10
const TK_N* =                0x11
const TK_O* =                0x12
const TK_P* =                0x13
const TK_Q* =                0x14
const TK_R* =                0x15
const TK_S* =                0x16
const TK_T* =                0x17
const TK_U* =                0x18
const TK_V* =                0x19
const TK_W* =                0x1A
const TK_X* =                0x1B
const TK_Y* =                0x1C
const TK_Z* =                0x1D
const TK_1* =                0x1E
const TK_2* =                0x1F
const TK_3* =                0x20
const TK_4* =                0x21
const TK_5* =                0x22
const TK_6* =                0x23
const TK_7* =                0x24
const TK_8* =                0x25
const TK_9* =                0x26
const TK_0* =                0x27
const TK_RETURN* =           0x28
const TK_ENTER* =            0x28
const TK_ESCAPE* =           0x29
const TK_BACKSPACE* =        0x2A
const TK_TAB* =              0x2B
const TK_SPACE* =            0x2C
const TK_MINUS* =            0x2D #  -
const TK_EQUALS* =           0x2E #  =
const TK_LBRACKET* =         0x2F #  [
const TK_RBRACKET* =         0x30 #  ]
const TK_BACKSLASH* =        0x31 #  \
const TK_SEMICOLON* =        0x33 #  ;
const TK_APOSTROPHE* =       0x34 #  '
const TK_GRAVE* =            0x35 #  `
const TK_COMMA* =            0x36 #  ,
const TK_PERIOD* =           0x37 #  .
const TK_SLASH* =            0x38 #  /
const TK_F1* =               0x3A
const TK_F2* =               0x3B
const TK_F3* =               0x3C
const TK_F4* =               0x3D
const TK_F5* =               0x3E
const TK_F6* =               0x3F
const TK_F7* =               0x40
const TK_F8* =               0x41
const TK_F9* =               0x42
const TK_F10* =              0x43
const TK_F11* =              0x44
const TK_F12* =              0x45
const TK_PAUSE* =            0x48 # Pause/Break
const TK_INSERT* =           0x49
const TK_HOME* =             0x4A
const TK_PAGEUP* =           0x4B
const TK_DELETE* =           0x4C
const TK_END* =              0x4D
const TK_PAGEDOWN* =         0x4E
const TK_RIGHT* =            0x4F # Right arrow
const TK_LEFT* =             0x50 # Left arrow
const TK_DOWN* =             0x51 # Down arrow
const TK_UP* =               0x52 # Up arrow
const TK_KP_DIVIDE* =        0x54 # '/' on numpad
const TK_KP_MULTIPLY* =      0x55 # '*' on numpad
const TK_KP_MINUS* =         0x56 # '-' on numpad
const TK_KP_PLUS* =          0x57 # '+' on numpad
const TK_KP_ENTER* =         0x58
const TK_KP_1* =             0x59
const TK_KP_2* =             0x5A
const TK_KP_3* =             0x5B
const TK_KP_4* =             0x5C
const TK_KP_5* =             0x5D
const TK_KP_6* =             0x5E
const TK_KP_7* =             0x5F
const TK_KP_8* =             0x60
const TK_KP_9* =             0x61
const TK_KP_0* =             0x62
const TK_KP_PERIOD* =        0x63 # '.' on numpad
const TK_SHIFT* =            0x70
const TK_CONTROL* =          0x71
const TK_ALT* =              0x72

# Mouse events/states

const TK_MOUSE_LEFT* =       0x80 # Buttons
const TK_MOUSE_RIGHT* =      0x81
const TK_MOUSE_MIDDLE* =     0x82
const TK_MOUSE_X1* =         0x83
const TK_MOUSE_X2* =         0x84
const TK_MOUSE_MOVE* =       0x85 # Movement event
const TK_MOUSE_SCROLL* =     0x86 # Mouse scroll event
const TK_MOUSE_X* =          0x87 # Cusor position in cells
const TK_MOUSE_Y* =          0x88
const TK_MOUSE_PIXEL_X* =    0x89 # Cursor position in pixels
const TK_MOUSE_PIXEL_Y* =    0x8A
const TK_MOUSE_WHEEL* =      0x8B # Scroll direction and amount
const TK_MOUSE_CLICKS* =     0x8C # Number of consecutive clicks

# If key was released instead of pressed, it's code will be OR'ed with TK_KEY_RELEASED:
# a) pressed 'A': 0x04
# b) released 'A': 0x04|VK_KEY_RELEASED = 0x104

const TK_KEY_RELEASED* =     0x100

# Virtual key-codes for internal terminal states/variables.
# These can be accessed via terminal_state function.

const TK_WIDTH* =            0xC0 # Terminal window size in cells
const TK_HEIGHT* =           0xC1
const TK_CELL_WIDTH* =       0xC2 # Character cell size in pixels
const TK_CELL_HEIGHT* =      0xC3
const TK_COLOR* =            0xC4 # Current foregroung color
const TK_BKCOLOR* =          0xC5 # Current background color
const TK_LAYER* =            0xC6 # Current layer
const TK_COMPOSITION* =      0xC7 # Current composition state
const TK_CHAR* =             0xC8 # Translated ANSI code of last produced character
const TK_WCHAR* =            0xC9 # Unicode codepoint of last produced character
const TK_EVENT* =            0xCA # Last dequeued event
const TK_FULLSCREEN* =       0xCB # Fullscreen state

# Other events

const TK_CLOSE* =            0xE0
const TK_RESIZED* =          0xE1

# Generic mode enum.
# Right now it is used for composition option only.

const TK_OFF* =                 0
const TK_ON* =                  1

# Input result codes for terminal_read function.

const TK_INPUT_NONE* =          0
const TK_INPUT_CANCELLED* =    -1

# Text printing alignment.

const TK_ALIGN_DEFAULT* =       0
const TK_ALIGN_LEFT* =          1
const TK_ALIGN_RIGHT* =         2
const TK_ALIGN_CENTER* =        3
const TK_ALIGN_TOP* =           4
const TK_ALIGN_BOTTOM* =        8
const TK_ALIGN_MIDDLE* =       12

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
