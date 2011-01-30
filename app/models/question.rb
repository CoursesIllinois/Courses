class Question < ActiveRecord::Base
  validates :title, :presence => true
  belongs_to :user
  has_many :responses

  def answer
    Response.where(:question_id => self.id, :is_answer => true)
  end

  def answer=(new_ans)
    raise 'Answer doesn\'t have an ID' unless new_ans.id

    # check new_ans exists in db
    raise "Answer #{new_ans.id} doesn't exist in db" unless Response.find(new_ans.id)
    new_ans.is_answer = true
    new_ans.question_id = self.id
    new_ans.save
    new_ans
  end
end
