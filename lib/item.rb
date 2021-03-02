class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = Hash.new
  end

  def add_bid(attendee, amount)
    bids[attendee] = amount
  end

  def current_high_bid
    bid_num = []
    @bids.each do |attendee, amount|
        bid_num.push(amount)
      end
    bid_num.max
  end
end
