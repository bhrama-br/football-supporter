require 'swagger_helper'

RSpec.describe 'api/admin/players', type: :request, swagger_doc: 'admin/swagger.yaml' do

  path '/api/admin/players' do

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

  path '/api/admin/players/{id}' do
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

  path '/api/admin/players/{player_id}/notification' do
    # You'll want to customize the parameter types...
    parameter name: 'player_id', in: :path, type: :string, description: 'player_id'

    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true

    parameter name: :auth, in: :body, schema: {
      type: :object,
      properties: {
        message: { type: :string }
      },
      required: [ 'message' ]
    }
    post('create_notification player') do
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
  
  path '/api/admin/{id}/notification' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'Notification id'

    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true
    put('/api/admin/{id}/notification') do
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

    delete('/api/admin/{id}/notification') do
      tags 'Players'
      parameter name: 'id', in: :path, type: :string, description: 'Notification id'

      parameter name: 'access-token', :in => :header, :type => :string, required: true
      parameter name: 'uid', :in => :header, :type => :string, required: true
      parameter name: 'client', :in => :header, :type => :string, required: true
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
