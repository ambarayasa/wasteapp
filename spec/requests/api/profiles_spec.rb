require 'swagger_helper'

RSpec.describe "Profile API", type: :request do
    
    path "/profile" do
        get "Retrieves a profile" do
            tags "profile"

            consumes 'application/json'
            parameter name: :profile, in: :body, schema: {
                type: :object,
                properties: {
                  email: { type: :string },
                },
                required: [ 'email' ]
              }

            produces "application/json"
            response "200", "Profile found" do
                schema type: :object,
                properties: {
                    data: {
                        properties: {
                            name: {type: :string},
                            username: {type: :string},
                            email: {type: :string},
                            address: {type: :string},
                            balance: {type: :float},
                            role: {type: :string},
                        }
                    }
                },
                required: [ "name", "username", "email", "address", "balance", "role"]

                let(:profile) { create(:profile) }
                run_test!
            end

            response '404', 'Profile not found' do
                let(:profile) { 'invalid' }
                run_test!
              end
        end
    end
end