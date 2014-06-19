module SimonSays
  class CommandList

    def initialize commands = ''
      @commands = commands.split(',')
    end

    def add command
      @commands << command
    end

    def size
      @commands.size
    end

    def to_s
      @commands.join ','
    end

    def equal? other
      to_s == other.to_s
    end
  end
end