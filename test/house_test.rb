require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class RoomTest < Minitest::Test

  def setup
    @house = House.new("$400000", "222 Shady Drive")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists_with_attributes
    assert_instance_of House, @house

    assert_equal "$400000", @house.price
    assert_equal "222 Shady Drive", @house.address
    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms_to_house
    assert_equal [], @house.rooms

    @house.add_room(@room_1)
    @house.add_room(@room_2)

    assert_equal [@room_1, @room_2], @house.rooms
  end

  def test_if_house_price_above_market_average
    assert_equal false, @house.above_market_average?
  end

  def test_it_returns_rooms_by_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
    assert_equal [@room_4], @house.rooms_from_category(:basement)
  end

  def test_house_can_return_total_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area
  end

  def test_house_returns_details_hash_with_attributes
    expected_hash = {"price" => 400000, "address" => "222 Shady Drive"}

    assert_equal expected_hash, @house.details
  end

  def test_it_returns_price_per_sq_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_returns_rooms_sorted_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4, @room_3, @room_2, @room_1], @house.rooms_sorted_by_area
  end


end
