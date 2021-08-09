class User < ApplicationRecord
    has_secure_password
    validtes :username, :email, uniqueness: true
end
