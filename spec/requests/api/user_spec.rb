require 'swagger_helper'

RSpec.describe 'api/user', type: :request do
  path "/users/sign_up" do
    post "Create new user" do
      tags "users"

      consumes "application/json"
      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        username: {
                          type: :string
                        },
                        password: {
                          type: :string
                        },
                        email: {
                          type: :string
                        },
                        name: {
                          type: :string
                        },
                        address: {
                          type: :string
                        },
                        gender: {
                          type: :string
                        },
                        balance: {
                          type: :string
                        },
                        role_id: {
                          type: :integer
                        }
                      }
                    }
                  }
                }

      produces "application/json"
      response "200", "Sucessfully Create User" do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: {
                       type: :integer
                     },
                     email: {
                       type: :string
                     },
                     name: {
                       type: :string
                     },
                   }
                 },
                 token: {
                    type: :string,
                 },
                 refresh_token: {
                    type: :string
                 },
               }
        let(:user) { create(:user) }
        run_test!
      end

      response "422", "Failed to Create User!" do
        let(:user) { "invalid" }
        run_test!
      end
    end
  end

  path "/users/sign_in" do
    post "Sign In" do
      tags "users"
      consumes "application/json"
      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: {
                      type: :string
                    },
                    password: {
                      type: :string
                    },
                  }
                }

      produces "application/json"
      response "200", "Log in Sucessfully" do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: {
                       type: :integer
                     },
                     email: {
                       type: :string
                     },
                     name: {
                       type: :string
                     },
                   }
                 },
                 token: {
                    type: :string,
                 },
                 refresh_token: {
                    type: :string
                 },
               }
        let(:user) { create(:user) }
        run_test!
      end

      response "422", "Invalid login Credentials" do
        schema type: :object,
               properties: {
                 message: {
                   type: :string,
                 }
               }
        let(:user) { "invalid" }
        run_test!
      end
    end
  end
end