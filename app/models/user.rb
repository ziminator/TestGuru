require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id

  has_secure_password

  def tests_by_level(level)
    user_test_relations.order(id: :desc).where(test_id: level.id)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
