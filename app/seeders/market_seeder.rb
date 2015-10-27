class MarketSeeder
  MARKETS = [
    {
      farm: Farm.first,
      day_of_week: "Monday",
      location: "on the corner"
    }, {
      farm: Farm.second,
      day_of_week: "Tuesday",
      location: "at the end of the sidewalk"
    }, {
      farm: Farm.second,
      day_of_week: "Wednesday",
      location: "in the parking lot"
    }, {
      farm: Farm.third,
      day_of_week: "Thursday",
      location: "at your house"
    }
  ]
  def self.seed!
    MARKETS.each do |market|
      Market.find_or_create_by!(market)
    end
  end
end
