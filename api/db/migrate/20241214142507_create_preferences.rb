class CreatePreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :preferences do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :looking_for_diet_type
      t.integer :lower_age
      t.integer :upper_age
      t.decimal :distance, precision: 10, scale: 5
      t.string :gender

      t.timestamps
    end
  end
end
