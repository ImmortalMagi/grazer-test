class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.decimal :locationX, precision: 10, scale: 5
      t.decimal :locationY, precision: 10, scale: 5
      t.string :diet_type
      t.integer :age

      t.timestamps
    end
  end
end
