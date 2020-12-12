class Server < ActiveRecord::Base
has_many :orders
has_secure_password
validates :name, uniqueness: true
end
