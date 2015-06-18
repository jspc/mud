require 'celluloid/io'

require 'mud/graph'
require 'mud/player'

class Server
  include Celluloid::IO
  finalizer :finalize
  attr_writer :height, :port, :threads, :width

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

  def finalize
    @server.close if @server
  end

  def log m
    puts "#{Time.now} - #{m}"
  end

  def run
    loop { async.handle_connection @server.accept }
  end

  def handle_connection(socket)
    _, port, host = socket.peeraddr
    log "Received connection from #{host}:#{port}"
    loop { play(socket) }
  rescue EOFError, Errno::EPIPE
    log "#{host}:#{port} disconnected"
    socket.close
  end

  def play socket
  end
end
