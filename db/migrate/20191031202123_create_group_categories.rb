class CreateGroupCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :group_categories do |t|
      t.references :category, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
