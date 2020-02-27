require 'date'

class Market
  attr_reader :name, :vendors, :date

  def initialize(name)
    @name = name
    @vendors = []
    @date = Date.today.strftime('%d/%m/%Y')
    # binding.pry
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      # !vendor.inventory[item].zero?
      vendor.check_stock(item) > 0
    end
  end

  def total_inventory
    result = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        result[item] = {quantity: 0, vendors: []} if result[item].nil?
        result[item][:quantity] += quantity
        result[item][:vendors] << vendor
      end
    end
    # binding.pry
    result
  end

  def overstocked_items
    total_inventory.select do |item, item_info|
      item_info[:quantity] > 50 && item_info[:vendors].length > 1
    end.keys
  end

  def sorted_item_list
    total_inventory.keys.map do |item|
      item.name
    end.sort
  end
end
