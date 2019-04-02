class User < ApplicationRecord

  has_many :user_test_relations
  has_many :tests, through: :user_test_relations
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true

  def get_level(level)
    user_test_relations.order(id: :desc).find_by(test_id: level.id)
    #Test.joins("JOIN user_test_relations ON user_test_relations.tests_id = \
    #tests.id").where("user_test_relations.users_id = id AND tests.level = #{level}")
  end
end
