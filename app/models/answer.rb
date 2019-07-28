class Answer < ApplicationRecord

  belongs_to :question

  validates :answer, presence: true
  validate :max_answer_count #, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def max_answer_count
    errors.add(:question_id) if question.answers.count >= 4
  end

end
