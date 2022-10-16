require 'swagger_helper'

RSpec.describe 'api/user/players', type: :request do

  path '/api/user/dashboard' do
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    get('dashboard player') do
      tags 'Players'

      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/user/players/{player_id}/subscribe' do
    # You'll want to customize the parameter types...
    parameter name: 'player_id', in: :path, type: :string, description: 'player_id'

    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    post('subscribe player') do
      tags 'Players'
      response(200, 'successful') do
        let(:player_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/user/players/{player_id}/unsubscribe' do
    # You'll want to customize the parameter types...
    parameter name: 'player_id', in: :path, type: :string, description: 'player_id'
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    post('unsubscribe player') do
      tags 'Players'
      response(200, 'successful') do
        let(:player_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/user/players' do
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    get('list players') do
      tags 'Players'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/user/players/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    get('show player') do
      tags 'Players'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
