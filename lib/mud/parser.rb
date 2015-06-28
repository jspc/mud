require 'treetop'
require 'mud/movement'

GRAMMARS = File.join(File.dirname(__FILE__), 'grammars')
require File.join(GRAMMARS, 'node_extensions.rb')

module ParsingError
  # s-expression didn't compile
  class InvalidStatement < ArgumentError ; end

  # command doesn't exist
  class InvalidCommand < ArgumentError ; end

  # context is incorrect for this command
  class InvalidContext < ArgumentError ; end
end

# Nuts and bolts parser using grammar at lib/mud/grammars.
#
# Strings are a subset of s-expressions and should be at
# least recognisable by lispy afficionados
class Parser

  def initialize
    Treetop.load(File.join(GRAMMARS, 'moves_parser.treetop'))
    @moves = MovesParser.new

    @movement_syns = %w{run move go walk travel}
    @movement_contexts = %w{run}
  end

  # Takes an s-expression string and returns an array
  # of actions to be taken
  #
  # ===== Attributes
  # * +data+ - s-expression string
  def parse! data
    @commands = []
    tree = @moves.parse(data)
    if tree.nil?
      raise ParsingError::InvalidStatement,
            ["'#{data}' is not a valid statement",
             @moves.failure_line,
             @moves.failure_reason].join('. ')
    end

    clean_tree(tree)
    elucidate(tree.elems)
    @commands
  end

  protected
  # Pares down the AST treetop generates for easy parsing
  #
  # ===== Attributes
  # * +rn+ - rootnode to clean
  def clean_tree rn
    return if(rn.elements.nil?)
    rn.elements.delete_if{|n| n.class.name == "Treetop::Runtime::SyntaxNode" }
    rn.elements.each {|n| clean_tree(n) }
  end

  # Recursively figure out commands and contexts
  #
  # ===== Attributes
  # * +tree+ - array or arrays, hashes, whatevers to turn into actions
  # * +context+ - certain actions have contexts; to run for example
  def elucidate tree, context=nil
    until tree.empty?
      subj = tree.shift

      if subj.is_a?(Array)
        self.elucidate(subj, context)

      elsif subj.is_a?(Hash) and not subj.has_key?(:argument)
        self.elucidate(tree.shift, subj[:command].to_s)

      else
        if @movement_syns.include?(subj[:command].to_s)
          if context and not @movement_contexts.include?(context)
            raise ParsingError::InvalidContext,
                  "'#{context}' is not a valid context for movement"
          end
          @commands << Movement.new(subj[:argument].to_s, context)
        else
          raise ParsingError::InvalidCommand,
                "'#{subj[:command]}' is not a valid command"

        end
      end
    end
  end

end
