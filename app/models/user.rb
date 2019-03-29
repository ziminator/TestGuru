class User < ApplicationRecord
  def get_level(level)
    Test.joins("JOIN user_test_relations ON user_test_relations.tests_id = \
    tests.id").where("user_test_relations.users_id = id AND tests.level = #{level}")
  end
end
