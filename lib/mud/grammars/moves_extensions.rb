# -*- mode: treetop -*-

grammar Moves do
    rule expression
      space? body space? <Expression>
    end

    rule body
      (expression / identifier / string)* <Body>
    end

    rule space
      [\s]+
    end

    rule identifier
      [a-zA-Z\=\*] [a-zA-Z0-9_\=\*]* <Identifier>
    end

    rule string
      '"' [a-zA-Z\=\*] [a-zA-Z0-9_\=\*]* '"' <StringLiteral>
    end

end
