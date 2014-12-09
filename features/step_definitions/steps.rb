Given(/^Mario has 3 Pizzas left over$/) do
  @mario = Restaurant.create! postcode: 'NW5 1RG', name: 'Marios', telephone_number: "+44005550006"
end

Given(/^Tony is a hungry person$/) do
  @tony = HungryPerson.create!(telephone_number: "+447964340312")
end

When(/^he announces those pizzas$/) do
  @got_food = "+447903575062"

  account_sid = ENV.fetch('TEST_TWILIO_SID')
  auth_token = ENV.fetch('TEST_TWILIO_AUTH_TOKEN')

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.account.messages.create(
    :from => @mario.telephone_number,
    :to => @got_food,
    :body => "3 pizzas"
  )

  post announcements_path({"ToCountry"=>"GB",
    "ToState"=>"",
    "SmsMessageSid"=>"SMc69059d1398b679fc4cb2bba1214c09e",
    "NumMedia"=>"0",
    "ToCity"=>"",
    "FromZip"=>"",
    "SmsSid"=>"SMc69059d1398b679fc4cb2bba1214c09e",
    "FromState"=>"",
    "SmsStatus"=>"received",
    "FromCity"=>"",
    "Body"=>"Ggyneth high",
    "FromCountry"=>"GB",
    "To"=> @got_food,
    "ToZip"=>"",
    "MessageSid"=>"SMc69059d1398b679fc4cb2bba1214c09e",
    "AccountSid"=>account_sid,
    "From"=> @mario.telephone_number,
    "ApiVersion"=>"2010-04-01"})

end

Then(/^a hungry person can get those pizzas$/) do

  account_sid = ENV.fetch('TWILIO_SID')
  auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')

  client = Twilio::REST::Client.new account_sid, auth_token

  soon do
    last_message_to_tony = client.account.messages.list(to: @tony.telephone_number).last
    expect(last_message_to_tony.body).to eq('3 pizzas at Marios! NW5 1RG')
  end
end
