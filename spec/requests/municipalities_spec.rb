require 'rails_helper'

# curl 'http://localhost:3000//municipalities?filter\[mapc\]=true&page\[size\]=351' \
# -XGET \
# -H 'Accept: application/json, text/javascript, */*; q=0.01' \
# -H 'Accept-Encoding: gzip, deflate' \
# -H 'Host: localhost:3000' \
# -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Safari/605.1.15' \
# -H 'Accept-Language: en-us' \
# -H 'Referer: http://localhost:4200/' \
# -H 'Connection: keep-alive'

RSpec.describe 'Municipalities', type: :request do
  it 'returns municipalities data' do
    municipality = create(:municipality)
    municipality2 = create(:municipality)
    headers = {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }

    get municipalities_path, params: { trunc: true }, headers: headers
    parsed_body = JSON.parse(response.body)
    expect(response.content_type).to eq('application/json')
    expect(parsed_body['data'][0]['attributes']['muni_id']).to eq(municipality.muni_id)
    expect(parsed_body['data'][0]['attributes']['name']).to eq(municipality.name)
    expect(parsed_body['data'][0]['links']['self']).to eq("#{Rails.application.routes.url_helpers.municipalities_url}/#{municipality.id}")
  end
end

# {
#   "data": [{
#     "type": "municipalities",
#     "id": "1",
#     "attributes": {
#       "muni_id": 11,
#       "name": "Ashmont"
#     },
#     "links": {
#       "self": "http://api.metrofuture.org/municipalities/1"
#     }
#   },
#   {
#     "type": "municipalities",
#     "id": "2",
#     "attributes": {
#       "muni_id": 25,
#       "name": "Bellingham"
#     },
#     "links": {
#       "self": "http://api.metrofuture.org/municipalities/2"
#     }
#   }]
# }

# curl 'http://localhost:3000/municipalities?filter\[mapc\]=true&page\[size\]=351' \
# -XGET \
# -H 'Accept: application/json, text/javascript, */*; q=0.01' \
# -H 'Origin: http://localhost:4200' \
# -H 'Referer: http://localhost:4200/' \
# -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Safari/605.1.15'
