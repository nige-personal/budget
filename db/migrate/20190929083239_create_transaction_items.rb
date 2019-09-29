class CreateTransactionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_items do |t|
      t.integer :category
      t.decimal :amount
      t.string :description
      t.references :transaction_header, foreign_key: true

      t.timestamps
    end
  end
end
