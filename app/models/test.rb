class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id, optional: true

  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :complicated, -> { by_level (5..FLOAT::INFINITY) }
  scope :with_category, -> (category_name) { joins(:category).where(categories: { title: category_name }) }

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }

  def self.name_tests(category_name)
    Test.get_category(category_name).order(title: :desc).pluck(:title)
  end

end
