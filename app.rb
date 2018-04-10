require 'sinatra'
require 'httparty'
require 'sinatra'
require 'plivo'
require 'json'
require 'dotenv/load'
include Plivo

configure do
    set :url, ENV['URL']
end

post '/sms_to_slack/' do
    # The phone number of the person who sent the SMS
    from_number = params[:From]
    # Your Plivo number that will receive the SMS
    to_number = params[:To]
    # The text which was received on your Plivo number
    text = params[:Text]
    # Post to slack channel
    HTTParty.post(settings.url, 
    body: {text: "FROM: #{from_number}\n MESSAGE: #{text}" }.to_json,
    headers: { "Content-Type": 'application/json' } )
end

