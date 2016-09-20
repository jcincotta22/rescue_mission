class Question < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 150 }
end
