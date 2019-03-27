class Test < ApplicationRecord
  def self.name_tests(cat)
    Test.select(:title).order(title: :desc).joins('JOIN categories \
    ON tests.categories_id = categories.id').where("category = '#{cat}'").pluck(:title)
  end
end
