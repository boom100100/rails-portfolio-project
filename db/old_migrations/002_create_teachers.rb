class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :username
      t.string :password_digest

      t.string :google_token
      t.string :google_refresh_token

      t.timestamps
    end
  end
end
