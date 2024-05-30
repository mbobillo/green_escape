class AddExperienceToAccomodations < ActiveRecord::Migration[7.1]
  def change
    add_reference :accomodations, :experience, null: false, foreign_key: true
  end
end
