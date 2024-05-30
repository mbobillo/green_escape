class RemoveExperienceFromAccomations < ActiveRecord::Migration[7.1]
  def change
    remove_reference :accomodations, :experience, null: false, foreign_key: true
  end
end
