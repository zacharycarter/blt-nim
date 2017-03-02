import ../blt

discard terminal_open()
discard terminal_set("window.title='foo'; window.size=80x25;")
discard terminal_printf(2, 23, "[color=orange]ESC.[/color] Exit")
discard terminal_printf_ext(77, 22, 0, 0, TK_ALIGN_RIGHT, "library version $1", terminal_get("version"))
discard terminal_printf_ext(77, 23, 0, 0, TK_ALIGN_RIGHT, "http://wyrd.name/en:bearlibterminal")

terminal_color(color_from_name("white"))

var n = terminal_printf(2, 1, "[color=orange]1.[/color] Wide color range: ").width

let longWord = "antidisestablishmentarianism."
for i in 0..<longWord.len:
  let factor = i/longWord.len
  let red = (1.0 - factor) * 255
  let green = factor * 255
  terminal_color(color_t color_from_argb(255, int red, int green, 0)) 
  terminal_put(cint 2+n+i, 1, long_word[i].cint)

terminal_color(color_from_name("white"))

discard terminal_print(2, 3, "[color=orange]2.[/color] Backgrounds: [color=black][bkcolor=gray] grey [/bkcolor] [bkcolor=red] red ")

discard terminal_print(2, 5, "[color=orange]3.[/color] Unicode support: Кириллица Ελληνικά α=β²±2°")

discard terminal_print(2, 7, "[color=orange]4.[/color] Tile composition: a + [color=red]/[/color] = a[+][color=red]/[/color], a vs. a[+][color=red]¨[/color]")

discard terminal_printf(2, 9, "[color=orange]5.[/color] Box drawing symbols:")

discard terminal_print(5, 11, """
     ┌────────┐  
     │!......s└─┐
  ┌──┘........s.│
  │............>│
  │...........┌─┘
  │<.@..┌─────┘  
  └─────┘        
""")


terminal_refresh()

var key = terminal_read()

while key != TK_CLOSE and key != TK_ESCAPE:
  key = terminal_read()

terminal_close()