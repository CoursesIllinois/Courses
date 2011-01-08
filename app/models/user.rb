class User < ActiveRecord::Base
  has_and_belongs_to_many :sections
  #TODO add deletion of relation/mapping from users_sections when a user is destroyed
  has_many :authorizations, :dependent => :destroy
  has_one :notify_pref, :dependent => :destroy
end
