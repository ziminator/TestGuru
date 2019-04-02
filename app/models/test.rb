class Test < ApplicationRecord

  has_many :users, through: :user_test_relations
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.name_tests(cat)
    Test.select(:title).order(title: :desc).joins('JOIN categories \
    ON tests.categories_id = categories.id').where("category = '#{cat}'").pluck(:title)
  end
end
