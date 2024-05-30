class AddImageUrlToExperiences < ActiveRecord::Migration[7.1]
  def change
    add_column :experiences, :image_url, :string
  end
end
