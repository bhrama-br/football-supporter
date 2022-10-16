require 'swagger_helper'

RSpec.describe 'api/auth', type: :request do
  path '/api/auth' do
    post('New User') do
      tags 'Auth'
      consumes 'application/json'
      parameter name: :auth, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          name: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: [ 'email', 'name', 'password', 'password_confirmation' ]
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

  path '/api/auth/sign_in' do
    post('Sign in User') do
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

  path '/api/auth/validate_token' do
    get('Validate token User') do
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
