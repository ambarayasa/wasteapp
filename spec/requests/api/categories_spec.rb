require "swagger_helper"

RSpec.describe "Categories API", type: :request do
  path "/categories" do
    get "Retrieves all categories" do
      tags "categories"

      produces "application/json"
      response "200", "categories found" do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     type: :object,
                     properties: {
                       id: {
                         type: :integer
                       },
                       name: {
                         type: :string
                       }
                     }
                   }
                 }
               }

        let(:categories) { create(:categories) }
        run_test!
      end
    end

    post "Create new category" do
      tags "categories"

      consumes "application/json"
      parameter name: :categories,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: {
                      type: :string
                    }
                  },
                  required: ["name"]
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
                     }
                   }
                 }
               },
               required: ["name"]

        let(:categories) { create(:categories) }
        run_test!
      end

      response "404", "Failed to add data" do
        let(:categories) { "invalid" }
        run_test!
      end
    end
  end

  path "/categories/{id}" do
    get "Find category by id" do
      tags "categories"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully find data" do
        schema type: :object,
               properties: {
                 data: {
                   properties: {
                     id: {
                       type: :integer
                     },
                     name: {
                       type: :string
                     }
                   }
                 }
               }

        let(:categories) { create(:categories) }
        run_test!
      end

      response "404", "Failed to find data" do
        let(:categories) { "invalid" }
        run_test!
      end
    end

    put "Update category by id" do
      tags "categories"
      parameter name: :id, in: :path, type: :integer

      consumes "application/json"
      parameter name: :categories,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: {
                      type: :string
                    }
                  },
                  required: ["name"]
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
                     }
                   }
                 }
               }

        let(:categories) { create(:categories) }
        run_test!
      end

      response "404", "Failed to update data" do
        let(:categories) { "invalid" }
        run_test!
      end
    end

    delete "Delete category by id" do
      tags "categories"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully deleted data" do
        let(:categories) { create(:categories) }
        run_test!
      end

      response "404", "Failed to delete data" do
        let(:categories) { "invalid" }
        run_test!
      end
    end
  end
end
