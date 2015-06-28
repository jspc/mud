require 'treetop'
require 'mud/movement'

GRAMMARS = File.join(File.dirname(__FILE__), 'grammars')
require File.join(GRAMMARS, 'node_extensions.rb')

module Error
  module Parser
    class InvalidStatement < ArgumentError ; end
  end
end

class Parser
  Treetop.load(File.join(GRAMMARS, 'moves_parser.treetop'))
  @@moves = MovesParser.new

  @@movement_syns = %w{run move go walk travel}
  @@movement_contexts = %w{run}

  def self.parse data
    tree = @@moves.parse(data)
    if tree.nil?
      raise Error::Parser::InvalidStatement,
            ["'#{data}' is not a valid statement",
             @@moves.failure_line,
             @@moves.failure_reason].join('. ')
    end

    self.clean_tree(tree)
    self.elucidate(tree.elems)
    return tree.elems
  end

  private
  def self.clean_tree rn
    return if(rn.elements.nil?)
    rn.elements.delete_if{|n| n.class.name == "Treetop::Runtime::SyntaxNode" }
    rn.elements.each {|n| self.clean_tree(n) }
  end

  def self.elucidate tree, context=nil
    puts "Elucidating on #{tree}"
    t_s = tree.clone
    until tree.empty?
      p tree
      subj = tree.shift
      puts "subj: #{subj}"
      puts "tree: #{tree}"

      if subj.is_a?(Array)
        puts "elucidate on #{subj}"
        self.elucidate(subj, context)
      end

      if subj.is_a?(Hash) and not subj.has_key?(:argument)
        self.elucidate(tree.shift, subj[:command].to_s)
      end

      puts "obj: #{Movement.new(subj[:argument], context)}"
    end

    puts "Done elucidating on #{t_s}"
  end

end
