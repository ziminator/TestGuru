class Question < ApplicationRecord

  has_many :answers
  has_many :gists
  belongs_to :test

  validates :question, presence: true

end
