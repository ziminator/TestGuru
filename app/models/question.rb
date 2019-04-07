class Question < ApplicationRecord

  belongs_to :test
  has_many :answers

  validates :question, presence: true

end
