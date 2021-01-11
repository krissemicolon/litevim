require "ncurses"
require "yaml"

Ymax, Xmax = NCurses.maxyx

# Main
NCurses.open do
    init()
    backgroundColor()
    NCurses.erase
    # move the cursor
    NCurses.move(x: 0, y: 1)
    # longname returns the verbose description of the current terminal

    NCurses.move(x: 0, y: 2)
    NCurses.addstr(NCurses.curses_version)

    NCurses.move(y: 10, x: 20)
    NCurses.addstr("LiteVim")
    NCurses.refresh
    NCurses.getch
end

def getConfig()
    YAML.parse(File.read("config.yml"))
end

def init()
    # initialize
    NCurses.cbreak
    NCurses.noecho
    NCurses.start_color
end

def backgroundColor()
    # Colorschemes 
    stealthblack = NCurses::ColorPair.new(1).init(NCurses::Color::WHITE, NCurses::Color::BLACK)
    alpinewhite = NCurses::ColorPair.new(1).init(NCurses::Color::BLACK, NCurses::Color::WHITE)
    
    NCurses.bkgd(stealthblack)
end

