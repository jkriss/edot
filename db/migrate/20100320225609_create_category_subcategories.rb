class CreateCategorySubcategories < ActiveRecord::Migration
  def self.up
    create_table :category_subcategories do |t|
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps
    end
  end

  def self.down
    drop_table :category_subcategories
  end
end
