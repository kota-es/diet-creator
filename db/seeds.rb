require "csv"

CSV.foreach('db/seeds/csv/shop.csv', headers: true) do |row|
  Shop.create(name: row['name'])
end