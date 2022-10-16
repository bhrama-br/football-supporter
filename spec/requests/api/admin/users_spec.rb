require 'swagger_helper'

RSpec.describe 'api/admin/users', type: :request, swagger_doc: 'admin/swagger.yaml' do

  path '/api/admin/users' do
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true

    get('list users') do
      tags 'Users'

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

  path '/api/admin/users/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'access-token', :in => :header, :type => :string, required: true
    parameter name: 'uid', :in => :header, :type => :string, required: true
    parameter name: 'client', :in => :header, :type => :string, required: true

    get('show user') do
      tags 'Users'
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
