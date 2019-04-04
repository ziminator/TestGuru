class User < ApplicationRecord

  has_many :user_test_relations
  has_many :tests, through: :user_test_relations
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def tests_by_level(level)
    user_test_relations.order(id: :desc).where(test_id: level)
  end
end
