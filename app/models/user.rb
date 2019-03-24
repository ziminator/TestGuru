class User < ApplicationRecord
  def get_level(level)
    tests = []
    tests << Test.select(:title).and(Test.where("level = ?", level))
  end
end
