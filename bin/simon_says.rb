$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simon_says'
require 'io/console'

game = SimonSays::Game.new STDOUT


begin
  game.start
  game.enter STDIN.gets.strip
  game.command_generator = SimonSays::CommandGenerator.instance

  while true
    game.generate_new_command
    game.simon_says
    game.tell_simon SimonSays::CommandList.new(STDIN.gets.strip)
  end

rescue SimonSays::Game::GameOver => e
end

