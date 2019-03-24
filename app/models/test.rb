class Test < ApplicationRecord
  def self.name_tests(level)
    titles = []
    titles << Test.select(:title).and(Test.where("level = ?", level)).and(Test.order('test DESC'))
  end
end
