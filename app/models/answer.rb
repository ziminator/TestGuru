class Answer < ApplicationRecord

  belongs_to :question
  scope :correct, -> { where(correct: true) }
  validates :answer, presence: true
  validate :max_answer_count

  def max_answer_count
    errors.add(:question_id) if question.answers.size >= 4
  end

end
