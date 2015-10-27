class FarmSeeder
  FARMS = [
    {
      name: "Red Sled Farm",
      # binding.pry
      email: User.first.email,
      user: User.first,
      phone: "123-345-3456",
      address: "234 Old Farm Rd.",
      city: "Slippery Rock",
      state: "NC",
      zip: "28694"
    }, {
      name: "Red Barn Farm",
      email: User.last.email,
      user: User.last,
      phone: "123-345-3456",
      address: "456 Lost Hollar",
      city: "Todd",
      state: "NC",
      zip: "28694"
    }, {
      name: "Red Shed Farm",
      email: User.second.email,
      user: User.second,
      phone: "123-345-3456",
      address: "567 Slip Stitch Pass",
      city: "Mossy Gap",
      state: "NC",
      zip: "28694"
    }, {
      name: "Red Boot Farm",
      email: User.third.email,
      user: User.third,
      phone: "123-345-3456",
      address: "908 Hop Skip Jump Cir",
      city: "Burnt Chimney",
      state: "NC",
      zip: "28694"
    }
  ]
  def self.seed!
    FARMS.each do |farm|
      Farm.find_or_create_by!(farm)
    end
  end
end
