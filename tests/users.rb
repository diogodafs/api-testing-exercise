require 'airborne'

Airborne.configure do |config|
  config.base_url = 'http://localhost:4567/api'
  config.headers = { 'x-auth-token' => '1234' }
end

describe 'get method' do

  it 'should get empty json' do
    get '/users'
    expect_status(200)
    expect_json([])
  end

  it 'should post and delete new user'do
    post '/users', {
      {
        "realm": "1234",
        "username": "John",
        "credentials": "1234",
        "challenges": "1234",
        "email": "john@email.com",
        "emailVerified": true,
        "verificationToken": "1234",
        "status": "",
        "created": "07-09-2015",
        "lastUpdated": "07-09-2015",
        "id": 1
      }
    expect_status(200)
    id = json_body[:id]

    delete "/users/#{id}"
    expect_status(204)
  end

end
