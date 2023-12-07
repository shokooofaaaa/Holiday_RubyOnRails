class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.date :from
      t.date :to
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
   # add_foreign_key :holidays, :users, column: :user_id
  end
end
