require 'json'
require 'rest-client'

SCHEDULER.every '2s' do |job|
  #send_event('production', {current: rand(100) })
  #send_event('integration', {current: rand(100) })


 # begin
  #build_url = 'validate.jsontest.com/?json={key : value}'
  build_url = 'numbersapi.com/random/date?json' 
  response = RestClient.get build_url, { accept: :json }
  data = JSON.parse(response.body)
  send_event('integration', {value: data['year'],value2: rand(100) })
  send_event('production', {value: data['number'],value2: rand(100)})


 

  


end

