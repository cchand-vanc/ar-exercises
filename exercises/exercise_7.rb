require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  def must_have_apparel
    unless mens_apparel.present? || womens_apparel.present?
      errors.add(:mens_apparel, "Must sell either men's apparel or women's apparel")
      errors.add(:womens_apparel, "Must sell either men's apparel or women's apparel")
    end
  end

end


class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates:hourly_rate, numericality: {only_integer: true, minimum: 40, maximum: 200}
  validates :store, presence: true
end

puts "Please input a store name: "
@select_store = gets.chomp
new_store = Store.new(@select_store)
puts new_store
