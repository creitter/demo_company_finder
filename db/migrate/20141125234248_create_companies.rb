class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :size
      t.integer :year
      t.string :industry
      t.decimal :revenue, scale:8, precision:2

      t.timestamps
    end
  end
end
