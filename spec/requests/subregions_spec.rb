require 'rails_helper'

RSpec.describe "Subregions", type: :request do
  it 'returns subregions data' do
    subregion = create(:subregion)
    subregion2 = create(:subregion)
    headers = {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }

    get subregions_path, params: { trunc: true }, headers: headers
    parsed_body = JSON.parse(response.body)
    expect(response.content_type).to eq('application/json')
    expect(parsed_body['data'][0]['attributes']['name']).to eq(subregion.name)
    expect(parsed_body['data'][0]['attributes']['abbv']).to eq(subregion.abbv)
    expect(parsed_body['data'][0]['links']['self']).to eq("#{Rails.application.routes.url_helpers.subregions_url}/#{subregion.id}")
  end
end

# {
#   "data": [{
#     "type": "subregions",
#     "id": "1",
#     "attributes": {
#       "name": "Inner Core Committee",
#       "abbv": "ICC"
#     },
#     "links": {
#       "self": "http://api.metrofuture.org/subregions/1"
#     }
#   },
#   {
#     "type": "subregions",
#     "id": "2",
#     "attributes": {
#       "name": "North Shore Task Force",
#       "abbv": "NTSF"
#     },
#     "links": {
#       "self": "http://api.metrofuture.org/subregions/2"
#     }
#   }
#   ]
# }
