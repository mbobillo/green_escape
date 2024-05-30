class ChangeDescriptionToText < ActiveRecord::Migration[7.1]
  def change
    change_column :accomodations, :description, :text
  end
end
