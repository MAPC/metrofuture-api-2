require 'rails_helper'

# curl 'http://localhost:3000//projects?filter\[mapc\]=true&page\[size\]=351' \
# -XGET \
# -H 'Accept: application/json, text/javascript, */*; q=0.01' \
# -H 'Accept-Encoding: gzip, deflate' \
# -H 'Host: localhost:3000' \
# -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Safari/605.1.15' \
# -H 'Accept-Language: en-us' \
# -H 'Referer: http://localhost:4200/' \
# -H 'Connection: keep-alive'

RSpec.describe 'Projects', type: :request do
  let(:valid_jsonapi_params) do
    hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    hash['data']['type'] = 'development'
    hash['data']['attributes'] = FactoryBot.attributes_for(:development)
    hash.to_json
  end

  it 'returns projects data' do
    project = create(:project)
    headers = {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }

    get projects_path, params: { trunc: true }, headers: headers
    parsed_body = JSON.parse(response.body)
    expect(response.content_type).to eq('application/json')
    
    binding.pry
    expect(parsed_body['data'][0]['attributes']['project_id']).to eq(project.project_id.to_s)
    expect(parsed_body['data'][0]['attributes']['title']).to eq(project.title)
    # expect(parsed_body['data'][0]['links']['self']).to eq("#{request.host}/projects/#{project.id}")
  end
end


# sample JSON output
# {
#   "data": [
#       {
#           "type": "projects",
#           "id": "5E9EA8F4-B9A8-E411-8B35-96147297305Blsdkfjsldkflkdsjfk",
#           "attributes": {
#               "title": "Ashland Open Space and Recreation Plan",
#               "image": "data:image/jpeg;base64,/9j/ "friggin huge string...."
#               "description": "Boxborough Master Plan",
#               "location": null,
#               "primary_department": "Land Use Division",
#               "project_manager": "Christine Madore",
#               "website": null,
#               "status": "In Progress"
#           },
#           "links": {
#               "self": "http://api.metrofuture.ngrok.com/projects/0B38F916-BAA8-E411-8B35-96147297305B",
#               "next": "http://api.metrofuture.ngrok.com/projects/5E9EA8F4-B9A8-E411-8B35-96147297305B",
#               "prev": "http://api.metrofuture.ngrok.com/projects/5E9EA8F4-B9A8-E411-8B35-96147297305B"
#           }
#       }, ....
