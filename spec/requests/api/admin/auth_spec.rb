require 'swagger_helper'

RSpec.describe 'api/admin_auth', type: :request, swagger_doc: 'admin/swagger.yaml' do
  path '/api/admin_auth/sign_in' do
    post('Sign in Admin') do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response(200, 'successful') do

        after do |res|
          res.metadata[:response][:content] = {
            'application/json' => {
              res: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/admin_auth/validate_token' do
    get('Validate token admin') do
      tags 'Auth'
      consumes 'application/json'

      response(200, 'successful') do

        after do |res|
          res.metadata[:response][:content] = {
            'application/json' => {
              res: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
