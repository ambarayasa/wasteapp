class User < ApplicationRecord
    has_secure_password

    # https://github.com/Gokul595/api_guard#refresh-access-token
    api_guard_associations refresh_token: 'refresh_tokens'
    has_many :refresh_tokens, dependent: :delete_all

    validates :email, presence: true, uniqueness: true, email: true
    validates :username, presence: true, uniqueness: true
    validates :balance, numericality: true

    def jwt_token_payload
      { id:'id' }
    end

    # Custom Return Json
    def as_json(options={})
        {
          :id => id,
          :email => email,
          :name => name,
          :created_at => created_at,
          :updated_at => updated_at
        }
    end
    
end
