require 'csv'    

csv_path = "./lib/data/users.csv"

CSV.foreach(csv_path, headers: true) do |row|
  User.create(row.to_hash)
end