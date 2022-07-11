require "swagger_helper"

RSpec.describe "Wastes API", type: :request do
  path "/wastes" do
    get "Retrieves all wastes" do
      tags "wastes"

      produces "application/json"
      response "200", "wastes found" do
        schema type: :object,
               properties: {
                 wastes: {
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
                       descriptions: {
                         type: :string
                       },
                       price: {
                         type: :float
                       },
                       category_id: {
                         type: :integer
                       }
                     }
                   }
                 }
               }

        let(:wastes) { create(:wastes) }
        run_test!
      end
    end

    post "Create new waste" do
      tags "wastes"

      consumes "application/json"
      parameter name: :wastes,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    name: {
                      type: :string
                    },
                    descriptions: {
                      type: :string
                    },
                    price: {
                      type: :float
                    },
                    category_id: {
                      type: :integer
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
                     descriptions: {
                       type: :string
                     },
                     price: {
                       type: :float
                     },
                     category_id: {
                       type: :integer
                     }
                   }
                 }
               },
               required: %w[name address]

        let(:wastes) { create(:wastes) }
        run_test!
      end

      response "404", "Failed to add data" do
        let(:wastes) { "invalid" }
        run_test!
      end
    end
  end

  path "/wastes/{id}" do
    get "Find waste by id" do
      tags "wastes"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully find data" do
        schema type: :object,
               properties: {
                 wastes: {
                   properties: {
                     id: {
                       type: :integer
                     },
                     name: {
                       type: :string
                     },
                     descriptions: {
                       type: :string
                     },
                     price: {
                       type: :float
                     },
                     category_id: {
                       type: :integer
                     }
                   }
                 },
                 category: {
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

        let(:wastes) { create(:wastes) }
        run_test!
      end

      response "404", "Failed to find data" do
        let(:wastes) { "invalid" }
        run_test!
      end
    end

    put "Update waste by id" do
      tags "wastes"
      parameter name: :id, in: :path, type: :integer

      consumes "application/json"
      parameter name: :wastes,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    id: {
                      type: :integer
                    },
                    name: {
                      type: :string
                    },
                    descriptions: {
                      type: :string
                    },
                    price: {
                      type: :float
                    },
                    category_id: {
                      type: :integer
                    }
                  },
                  required: %w[name descriptions price category_id]
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
                     descriptions: {
                       type: :string
                     },
                     price: {
                       type: :float
                     },
                     category_id: {
                       type: :integer
                     }
                   }
                 }
               }

        let(:wastes) { create(:wastes) }
        run_test!
      end

      response "404", "Failed to update data" do
        let(:wastes) { "invalid" }
        run_test!
      end
    end

    delete "Delete waste by id" do
      tags "wastes"
      parameter name: :id, in: :path, type: :integer

      produces "application/json"
      response "200", "Sucessfully deleted data" do
        let(:wastes) { create(:wastes) }
        run_test!
      end

      response "404", "Failed to delete data" do
        let(:wastes) { "invalid" }
        run_test!
      end
    end
  end
end
