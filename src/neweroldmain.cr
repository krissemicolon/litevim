require "ncurses"
require "yaml"

height, width = NCurses.maxy, NCurses.maxx

# Main
NCurses.open do
    init()
    backgroundColor()
    NCurses.erase
    NCurses.move(x: width, y: height)
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

