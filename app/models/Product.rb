# frozen_string_literal: true
class Product < ApplicationRecord
  attr_accessor :image

  belongs_to :category
  belongs_to :builder

  validates :name, presence: true
  validates :build_material, presence: true
  validates :blurb, length: { maximum: 60 }
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  def pricing_object
    if Pricing.find_by(product_id: self.id) != nil
      Pricing.find_by(product_id: self.id)
    end
  end

  def widths
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["dimensions"]["widths"]
    end
  end

  def heights
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["dimensions"]["heights"]
    end
  end

  def colors(builder)
    if builder == "Evergreen"
      [
        'Natural',
        'White Wash',
        'Honey',
        'Golden Oak',
        'Meadow Oak',
        'Sable',
        'Cinnamon',
        'Orange Walnut',
        'Spanish Pecan',
        'Country Pine',
        'Espresso',
        'Mocha',
        'Black Cherry',
        'Dark Cherry',
        'Orange #2',
        'Traditional Cherry',
        'Traditional Mahogany',
        'English Chestnut',
        'Black',
        'Acorn'
      ]
    elsif builder == "Berkshire"
      [
        'Natural',
        'White Wash',
        'Honey',
        'Golden Oak',
        'Meadow Oak',
        'Sable',
        'Cinnamon',
        'Orange Walnut',
        'Spanish Pecan',
        'Country Pine',
        'Espresso',
        'Mocha',
        'Black Cherry',
        'Dark Cherry',
        'Orange #2',
        'Traditional Cherry',
        'Traditional Mahogany',
        'English Chestnut',
        'Black',
        'Acorn',
        'White Dove',
        'Bright White',
        'Parsley Snips',
        'Big Sky Blue',
        'Chili Pepper Red'
      ]
    end
  end

  def unfinished_prices
    if Pricing.find_by(product_id: self.id) != nil
      data = JSON.parse(Pricing.find_by(product_id: self.id).data)
      data["item_pricing"]["unfinished_pricing"]
    end
  end

  def finished_prices
    if Pricing.find_by(product_id: self.id) != nil
      data = self.unfinished_prices
      data.each do |key, value|
        value.each_with_index do |price, index|
          fin_price = price.to_i
          fin_price = (fin_price * 1.5).to_i
          value[index] = fin_price.to_s
        end
      end
    end
  end
end
