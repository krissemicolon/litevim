require "ncurses"

NCurses.open do
  # initialize
  NCurses.cbreak
  NCurses.noecho
  NCurses.start_color

  # define background color
  pair = NCurses::ColorPair.new(1).init(NCurses::Color::RED, NCurses::Color::BLACK)
  NCurses.bkgd(pair)

  NCurses.erase
  # move the cursor
  NCurses.move(x: 0, y: 1)
  # longname returns the verbose description of the current terminal
  NCurses.addstr(NCurses.longname)

  NCurses.move(x: 0, y: 2)
  NCurses.addstr(NCurses.curses_version)

  NCurses.move(y: 10, x: 20)
  NCurses.addstr("Hello, world!")
  NCurses.refresh

  NCurses.notimeout(true)
  NCurses.getch
end

