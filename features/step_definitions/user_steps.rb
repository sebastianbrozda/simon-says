Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game.start
end

When(/^I enter the game as "(.*?)"$/) do |username|
  game.enter username
end

When(/^I don't write username$/) do
  begin
    game.enter ''
  rescue SimonSays::Game::GameOver => e
  end
end

Given(/^I started the game$/) do
  steps %Q{
  Given I am not yet playing
  When I start a new game
  And I enter the game as "sebastian"
  }
end

When(/^Simon says "(.*?)"$/) do |command|
  commands = command.split(',')
  game.command_generator = command_generator(commands)
  commands.size.times { game.generate_new_command }
  game.simon_says
end

When(/^I say "(.*?)"$/) do |command|
  begin
    game.tell_simon create_command_list_from(command)
  rescue
  end
end

