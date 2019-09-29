class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :user
      t.date :transaction_date
      t.integer :account
      t.integer :supplier
      t.string :sign
      t.date :reconciled
      t.decimal :total

      t.timestamps
    end
  end
end
