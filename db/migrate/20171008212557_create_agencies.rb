class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name
      t.integer :type
      t.integer :no_of_sales

      t.timestamps
    end
  end
end
