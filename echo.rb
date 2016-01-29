require "socket"

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  puts request_line

  client.puts "HTTP/1.0 200 OK"
  client.puts "ContentType: text/html"
  client.puts
  client.puts "<html>"
  client.puts "<body>"
  client.puts request_line
  client.puts rand(6) + 1
  client.puts "</body>"
  client.puts "</html>"
  client.close


end