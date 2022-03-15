require 'webrick'

server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})

['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/test', WEBrick::HTTPServlet::ERBHandler, 'test.html.erb')

# この一行を追記
server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

server.mount('/goyo.cgi', WEBrick::HTTPServlet::CGIHandler, 'goyo.rb')

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'exam.html.erb')

server.mount('/exam.cgi', WEBrick::HTTPServlet::CGIHandler, 'exam.rb')
server.mount('/examB.cgi', WEBrick::HTTPServlet::CGIHandler, 'examB.rb')
server.start
