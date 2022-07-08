require "swagger_helper"

RSpec.describe "Depots API", type: :request do
  path "/depots" do
    get "Retrieves all depots" do
      tags "depots"

      produces "application/json"
      response "200", "depots found" do
        schema type: :object,
               properties: {
                 depots: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: {
                         type: :integer
                       },
                       name: {
                         type: :string
                       },
                       address: {
                         type: :string
                       }
                     }
                   }
                 }
               }

        let(:depots) { create(:depots) }
        run_test!
      end
    end

    post "Create new depot" do
      tags "depots"

      consumes "application/json"
      parameter name: :depots,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: {
                      type: :string
                    },
                    address: {
                      type: :string
                    }
                  },
                  required: %w[name address]
                }

      produces "application/json"
      response "200", "Sucessfully added data" do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: {
                       type: :integer
                     },
                     name: {
                       type: :string
                     },
                     address: {
                       type: :string
                     }
                   }
                 }
               },
               required: %w[name address]

        let(:depots) { create(:depots) }
        run_test!
      end

      response "404", "Failed to add data" do
        let(:depots) { "invalid" }
        run_test!
      end
    end
  end

  path "/depots/{id}" do
    get "Find depot by id" do
      tags "depots"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully find data" do
        schema type: :object,
               properties: {
                 depots: {
                   properties: {
                     id: {
                       type: :integer
                     },
                     name: {
                       type: :string
                     },
                     address: {
                       type: :string
                     }
                   }
                 }
               }

        let(:depots) { create(:depots) }
        run_test!
      end

      response "404", "Failed to find data" do
        let(:depots) { "invalid" }
        run_test!
      end
    end

    put "Update depot by id" do
      tags "depots"
      parameter name: :id, in: :path, type: :integer

      consumes "application/json"
      parameter name: :depots,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: {
                      type: :string
                    },
                    address: {
                      type: :string
                    }
                  },
                  required: %w[name address]
                }

      produces "application/json"
      response "200", "Sucessfully updated data" do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: {
                       type: :integer
                     },
                     name: {
                       type: :string
                     },
                     address: {
                       type: :string
                     }
                   }
                 }
               }

        let(:depots) { create(:depots) }
        run_test!
      end

      response "404", "Failed to update data" do
        let(:depots) { "invalid" }
        run_test!
      end
    end

    delete "Delete depot by id" do
      tags "depots"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully deleted data" do
        let(:depots) { create(:depots) }
        run_test!
      end

      response "404", "Failed to delete data" do
        let(:depots) { "invalid" }
        run_test!
      end
    end
  end
end
