class CreateSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :description
      t.string :location
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
