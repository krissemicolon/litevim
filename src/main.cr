require "ncurses"

NCurses.open do
    # Init
    NCurses.cbreak
    NCurses.noecho
    NCurses.keypad(true)

    # Getting Max Y, X
    maxY, maxX = NCurses.maxy, NCurses.maxx
    maxY -= 1
    maxX -= 1

    # Getting File
    filename = ARGV[0]
    filecontent = File.read_lines(filename)

    NCurses.start_color
    pair = NCurses::ColorPair.new(1).init(NCurses::Color::WHITE, NCurses::Color::BLACK)
    NCurses.bkgd(pair)

    NCurses.erase
    NCurses.move(x: 0, y: maxY)
    NCurses.addstr("LiteVim")
    
    pos = 0
    filecontent.each do |i|
        NCurses.move(x: 0, y: pos)
        pos += 1
        NCurses.addstr(i)
        puts i
    end


    NCurses.refresh

    NCurses.notimeout(true)
    NCurses.getch
end

