class Question < ApplicationRecord

  has_many :answers
  belongs_to :test

  validates :question, presence: true

end
