class Course < ActiveRecord::Base
  belongs_to :major
  has_many :sections
end
