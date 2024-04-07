class User < ApplicationRecord
    has_secure_password

    validates :email, :last_name, :first_name,  presence: true

    enum :role, {client: 0, admin: 1} 
end
