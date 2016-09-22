class Answer < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 40 }
  belongs_to :question

end
