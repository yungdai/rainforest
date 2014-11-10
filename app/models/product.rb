class Product < ActiveRecord::Base
  # This makes sure that you validate that there is data in description and name and makes
  # sure that the price has a numerical integer value
  validates :description, :name, presence: true
  validates :price_in_cents, numericality: {only_integer: true}

  # This will make sure that the price is formatted for dollars and cents
  def formatted_price
    price_in_dollars = price_in_cents.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end
end
