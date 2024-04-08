class User < ApplicationRecord
    has_secure_password

    has_one :wallet
    has_many :portfolios
    

    validates :email, :last_name, :first_name,  presence: true

    enum :role, {client: 0, admin: 1} 
end
