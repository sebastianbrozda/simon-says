module SimonSays
  class Game

    class GameOver < StandardError
    end

    attr_accessor :command_generator

    def initialize output
      @output = output
      @simon_command_list = CommandList.new
    end

    def start
      @output.puts "Welcome to Simon Says"
      @output.puts "Please, enter your name:"
    end

    def enter username = ''
      if username.empty?
        @output.puts "I don't play with anonymous, bye"
        raise Game::GameOver
      else
        @output.puts "Nice to meet you, #{username}, lets play..."
      end
    end

    def generate_new_command
      @simon_command_list.add command_generator.generate
    end

    def simon_says
      @output.puts "Simon says: #{@simon_command_list}"
    end

    def tell_simon user_commands
      if @simon_command_list.equal?(user_commands)
        correct_answer(user_commands)
      else
        game_over
      end
    end

    private
    def score
      @score ||= 1
    end

    def game_over
      @score = @simon_command_list.size - 1
      @output.puts "Game over"
      @output.puts "Your score: #{score}"
      raise Game::GameOver
    end

    def correct_answer(user_commands)
      @score = user_commands.size
      @output.puts "Correct. Now try to remember #{user_commands.size + 1} commands."
      @output.puts "Your score: #{score}"
    end
  end
end