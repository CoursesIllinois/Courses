class Announcement < ActiveRecord::Base
  belongs_to :courses
  belongs_to :sections
end
