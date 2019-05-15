require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  let(:valid_jsonapi_params) do
    hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    hash["data"]['type'] = 'development'
    hash["data"]["attributes"] = FactoryBot.attributes_for(:development)
    hash.to_json
  end

  it 'returns JSON data for all projects at /projects' do
    project = create(:project)
    project2 = create(:project)
    headers = {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }

    get projects_path, params: { trunc: true }, headers: headers
    parsed_body = JSON.parse(response.body)
    expect(response.content_type).to eq('application/json')
    
    expect(parsed_body["data"][0]["attributes"]["title"]).to eq(project.title)
    expect(parsed_body["data"][0]["attributes"]["id"]).to eq(project.id)
    expect(parsed_body["data"][0]["links"]["self"]).to eq("#{Rails.application.routes.url_helpers.projects_url}/#{project.id}")
  end

  it 'returns JSON data for a single project at /projects/:id' do
    project = create(:project)
    headers = {
      'ACCEPT' => 'application/json',
      'HTTP_ACCEPT' => 'application/json'
    }

    get projects_path(project), params: { trunc: true }, headers: headers
    parsed_body = JSON.parse(response.body)
    expect(response.content_type).to eq('application/json')
    
    expect(parsed_body["data"][0]["attributes"]["title"]).to eq(project.title)
    expect(parsed_body["data"][0]["attributes"]['id']).to eq(project.id)
    expect(parsed_body["data"][0]["links"]["self"]).to eq("#{Rails.application.routes.url_helpers.project_url(project)}")
  end
end
