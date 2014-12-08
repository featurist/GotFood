class Restaurant < ActiveRecord::Base
  has_many :meals
  validates :name, presence: true
  validates :postcode, presence: true
  validates :telephone_number, presence: true

  def announce_meal(description)
    @got_food = "+447903575062"
    xml = '<?xml version="1.0" encoding="UTF-8"?>
    <Response>'
    xml += "<Sms from=\"#{@got_food}\" to=\"#{telephone_number}\">Thanks #{name}! Notifying the hungry people...</Sms>"
    xml += "</Response>"

    account_sid = ENV.fetch('TWILIO_SID')
    auth_token = ENV.fetch('TWILIO_AUTH_TOKEN')

    @client = Twilio::REST::Client.new account_sid, auth_token

    HungryPerson.all.each do |person|
      @message = @client.account.messages.create(
        :from => @got_food,
        :to => person.telephone_number,
        :body => "Hi! Theres a meal going: #{description} at #{name} #{postcode}. Reply 'YUM' to claim it"
      )
    end

    xml
  end
end
