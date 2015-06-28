module Error
  module Parser
    class CompileError < ArgumentError ; end
  end
end

module Moves
  class Body < Treetop::Runtime::SyntaxNode
    def value ; elems ; end
    def elems
      self.elements.map {|x| x.elems}
    end
  end

  class Expression < Treetop::Runtime::SyntaxNode
    def elems
      e = self.elements.first.elems
      if e.first.is_a?(Hash) and not e[1].is_a?(Array)
        return [e.inject(:merge)]
      end
      return e
    end
  end

  class Command < Treetop::Runtime::SyntaxNode
    def value
      self.text_value.to_sym
    end

    def elems
      {command: self.value}
    end
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
    def value
      eval(self.text_value)
    end

    def elems
      {argument: self.value}
    end
  end

  class FloatLiteral < Treetop::Runtime::SyntaxNode
    def value
      self.text_value.to_f
    end

    def elems
      {argument: self.value}
    end
  end

  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def value
      self.text_value.to_i
    end

    def elems
      {argument: self.value}
    end
  end
end
