class User < ApplicationRecord

  has_many :user_test_relations
  has_many :tests, through: :user_test_relations
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id

  def get_level(level)
    user_test_relations
    Test.joins("JOIN user_test_relations ON user_test_relations.tests_id = \
    tests.id").where("user_test_relations.users_id = id AND tests.level = #{level}")
  end
end
