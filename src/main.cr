require "ncurses"

main()
def main()
    filecontent = File.read("file.txt")
    NCurses.open do
        init()
        backgroundColor()
        # move the cursor
        NCurses.move(x: 0, y: 1)
        # longname returns the verbose description of the current terminal
        NCurses.addstr(NCurses.longname)

        NCurses.move(x: 0, y: 2)
        NCurses.addstr(NCurses.curses_version)

        NCurses.move(y: 100, x: 20)
        NCurses.addstr("LiteVim")
        NCurses.refresh

        NCurses.notimeout(true)
        NCurses.getch
    end
end

# initialize TUI
def init
    NCurses.cbreak
    NCurses.noecho
    NCurses.start_color
end

# define background color
def backgroundColor
    pair = NCurses::ColorPair.new(1).init(NCurses::Color::WHITE, NCurses::Color::BLACK)
    NCurses.bkgd(pair)
    NCurses.erase
end

