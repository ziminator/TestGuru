class User < ApplicationRecord
  def get_level(level)
    Test.joins("JOIN user_test_relations ON user_test_relations.tests_id = \
    ests.id").where("user_test_relations.users_id = 1 AND tests.level = #{level}")
  end
end
