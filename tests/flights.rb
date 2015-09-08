require 'airborne'

Airborne.configure do |config|
  config.base_url = 'http://localhost:4567/api'
  config.headers = { 'x-auth-token' => '1234' }
end

describe 'get method' do

  it 'should get empty json' do
    get '/flights'
    expect_status(200)
    expect_json([])
  end

  it 'should post and delete new flight'do
    post '/flights', {
      "data_partida": "07-09-2015",
      "data_chegada": "07-09-2015",
      "numero": "1234",
      "origem": "CNF",
      "destino": "GRU",
      "duracao": 1,
      "lugares": 50,
      "companhia": "Azul"
    }
    expect_status(200)
    id = json_body[:id]

    delete "/flights/#{id}"
    expect_status(204)
  end

end
