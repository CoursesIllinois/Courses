class User < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_many :authorizations
end
