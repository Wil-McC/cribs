class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def price_to_integer
    @price.delete('$').to_i
  end

  def above_market_average?
     price_to_integer > 500000
  end

  def rooms_from_category(category)
    @rooms.select do |room|
      room.category == category
    end
  end

  def area
    total_area = 0
    @rooms.each do |room|
      total_area += room.area
    end
    total_area
  end

  def details
    details_hash = {
      "price" => price_to_integer,
      "address" => @address
    }
  end

  def price_per_square_foot
    (price_to_integer.to_f / area.to_f).round(2)
  end

  def rooms_sorted_by_area
    room_areas = @rooms.map do |room|
      room.area
    end
    
  end
end
