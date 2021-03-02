require "minitest/autorun"
require "minitest/pride"
require "./lib/item.rb"
require './lib/auction'
require './lib/attendee'

class ItemTest < Minitest::Test
  def test_it_exists
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    assert_instance_of Item, item1
  end

  def test_it_has_attributes
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    assert_equal 'Chalkware Piggy Bank', item1.name
  end

  def test_it_can_add_bids
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expected = {attendee2 => 20, attendee1 => 22}
    assert_equal expected, item1.bids
  end

  def test_current_high_bid
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    assert_equal 22, item1.current_high_bid
  end
end
