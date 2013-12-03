account_sid = 'YOUR TWILIO ACCOUNT ID'
auth_token = 'YOUR TWILIO AUTH TOKEN'

# set up a client to talk to the Twilio REST API
TWILIO_CLIENT = Twilio::REST::Client.new(account_sid, auth_token)
TWILIO_FROM_NUMBER = 'YOUR TWILIO PHONE NUMBER'
