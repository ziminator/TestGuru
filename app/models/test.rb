class Test < ApplicationRecord

  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :complicated, -> { by_level (5..FLOAT::INFINITY) }
  scope :with_category, -> (category_name) { joins(:category).where(categories: { title: category_name }) }

  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :time_limit, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    allow_blank: true
  }

  def self.name_tests(category_name)
    with_category(category_name).order(id: :desc).pluck(:title)
  end

end
