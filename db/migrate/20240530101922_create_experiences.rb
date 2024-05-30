class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :title
      t.text :description
      t.string :kind
      t.float :price

      t.timestamps
    end
  end
end
