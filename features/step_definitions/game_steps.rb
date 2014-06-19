Then(/^I should see "(.*?)"$/) do |message|
  expect(output.messages).to include(message)
end
