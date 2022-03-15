require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['quality']
  "<html>
    <body>
      #{get}
    </body>
  </html>"
}
