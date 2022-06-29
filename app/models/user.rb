class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :balance, numericality: true

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
