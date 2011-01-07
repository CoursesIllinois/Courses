class User < ActiveRecord::Base
  has_and_belongs_to_many :sections
  has_many :authorizations, :dependent => :destroy
  has_one :notify_pref, :dependent => :destroy
  
  validates :isStudent, :presence => true
end
