require 'spec_helper'

describe API::HeartbeatController, type: :request do
  before(:each) { api_get '/status' }

  describe 'status GET' do
    it 'is success' do
      expect(response.status).to eql 200
    end

    it 'is JSON respnose content type' do
      expect(response.content_type).to eql Mime::JSON
    end

    it 'has OK body' do
      message = json(response.body)
      expect(message).to eq(message: 'OK')
    end
  end
end
