require 'spec_helper'

describe API::HomesController, type: :request do
  let(:headers) do
    {
      'ACCEPT' => Mime::JSON,
      'CONTENT_TYPE' => 'application/json'
    }
  end

  let(:valid_attributes) { { decision: 'on' } }

  describe 'GET hundred' do
    it 'is success' do
      api_get '/', { format: :json }, headers
      expect(response.status).to eq(200) # success
      expect(response.content_type).to eql Mime::JSON
    end
  end

  describe 'GET populate' do
    it 'is success' do
      api_get '/populate', { format: :json }, headers
      expect(response.status).to eq(200) # success
      expect(response.content_type).to eql Mime::JSON
    end
  end

  describe 'PUT ilike' do
    it 'returns no content' do
      api_put '/populate/1',
              valid_attributes.to_json,
              headers
      expect(response.status).to eql 204 # no content
    end
  end

  describe 'GET show' do
    it 'is success' do
      api_get '/populate/1', { format: :json }, headers
      expect(response.status).to eq(200) # success
      expect(response.content_type).to eql Mime::JSON
    end

    it 'is with like' do
      api_get '/populate/1', { format: :json }, headers
      message = json(response.body)
      expect(message).to eq(fizzbuzz: { id: '1', decision: nil })
    end

    it 'is with unlike' do
      api_put '/populate/1',
              valid_attributes.to_json,
              headers
      api_get '/populate/1', { format: :json }, headers
      message = json(response.body)
      expect(message).to eq(fizzbuzz: { id: '1', decision: 'on' })
    end
  end
end
