require 'json'
require 'rest-client'

SCHEDULER.every '2s' do |job|
  #send_event('production', {current: rand(100) })
  #send_event('integration', {current: rand(100) })


 # begin
  #build_url = 'validate.jsontest.com/?json={key : value}'
  #build_url = 'numbersapi.com/random/date?json' 
  build_url = 'echo.jsontest.com/TestGroup1/1/TestGroup2/0/TestGroup3/21/TestGroup4/-1/TestGroup5/--'

  response = RestClient.get build_url, { accept: :json }
  data = JSON.parse(response.body)
  send_event('TestGroup1', {value: data['TestGroup1'],value2: rand(100) })
  send_event('TestGroup2', {value: data['TestGroup2'],value2: rand(100)})
  send_event('TestGroup3', {value: data['TestGroup3'],value2: rand(100)})
  send_event('TestGroup4', {value: data['TestGroup4'],value2: rand(100)})
  send_event('TestGroup5', {value: data['TestGroup5'],value2: '--'})


end

