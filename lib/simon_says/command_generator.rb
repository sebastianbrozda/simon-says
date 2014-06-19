module SimonSays
  class CommandGenerator
    include Singleton

    def generate
      command_range.sample
    end

    private
    def command_range
      ['A', 'B', 'C', 'D', 'E']
    end
  end
end