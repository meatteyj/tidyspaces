class ApiConnector
  attr_accessor :title, :description, :url

  def initialize(title:, description:, url: "http://google.com/")
      @title = title
      @description = description
      @url = url
  end
end

class SmsConnector < ApiConnector
  def send_sms
    puts "Sending SMS message with title #{@title} and message #{@description}"
  end
end

api = ApiConnector.new(title: "hello mate", description: "WTF")
sms = SmsConnector.new(description: "I have the shit lmk", title:"YO")
sms.send_sms
puts api.url
