class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :recipe_id
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
