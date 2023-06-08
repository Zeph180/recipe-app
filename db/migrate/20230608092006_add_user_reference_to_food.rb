class AddUserReferenceToFood < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :user, foreign_key: true, null: false
  end
end
