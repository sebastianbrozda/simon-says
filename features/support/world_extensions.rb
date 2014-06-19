module KnowsTheDomain
  def output
    @output ||= SimonSays::Output.new
  end

  def game
    @game ||= SimonSays::Game.new output
  end


  class CommandGenerator
    def initialize commands
      @commands = commands
      @idx = 0
    end

    def generate
      c = @commands[@idx]
      go_to_next
      c
    end

    private
    def go_to_next
      @idx += 1
    end
  end

  def command_generator(commands)
    @command_generator ||= CommandGenerator.new commands
  end

  def create_command_list_from commands
    SimonSays::CommandList.new commands
  end
end

World(KnowsTheDomain)