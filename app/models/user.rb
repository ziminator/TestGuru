class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :made_tests, class_name: 'Test', foreign_key: :user_id
  has_many :gists
  has_many :feedbacks
  has_many :users_badges
  has_many :badges, through: :users_badges

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL}, uniqueness: { case_sensetive: true }

  def tests_by_level(level)
    #tests.where(level: level)
    tests.by_level(level)
    #user_test_relations.order(id: :desc).where(test_id: level.id)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

end
