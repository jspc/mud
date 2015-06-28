require 'celluloid/io'

require 'mud/graph'
require 'mud/player'

# Multithreaded network server for playing the game
#
# ===== Examples:
#   s = Server.new do |serv|
#     serv.host    = 'localhost'
#     serv.port    = 1234
#     serv.width   = 2000
#     serv.height  = 2000
#     serv.threads = 10
#   end
#   s.run
class Server
  include Celluloid::IO
  finalizer :finalize
  attr_writer :height, :port, :threads, :width

  # Create a server from a block
  #
  # ===== Attributes
  # * +:host+ - listening host
  # * +:port+ - listening port
  # * +:width+ - width of graph to create
  # * +:height+ - height of graph to create
  # * +:threads+ - number of threads to run with
  def initialize
    @host    = '127.0.0.1'
    @port    = 12600
    @width   = 20
    @height  = 20
    @threads = 5

    yield self if block_given?

    @graph = Graph.new do |g|
      g.width =  @width
      g.height = @height
    end.graph

    @server = TCPServer.new(@host, @port)
    async.run
  end

  # Close down threads and server
  def finalize
    @server.close if @server
  end

  # Log messages
  def log m
    puts "#{Time.now} - #{m}"
  end

  # Run the application
  def run
    loop { async.handle_connection @server.accept }
  end

  # Celluloid magic
  def handle_connection(socket)
    _, port, host = socket.peeraddr
    log "Received connection from #{host}:#{port}"
    loop { play(socket) }
  rescue EOFError, Errno::EPIPE
    log "#{host}:#{port} disconnected"
    socket.close
  end

  # On connection, creates player and plays game
  def play socket
  end
end
