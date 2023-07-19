class CreateClientAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :client_admins do |t|
      t.references :google_user, null: true, foreign_key: true
      t.references :discord_user, null: true, foreign_key: true
      t.references :github_user, null: true, foreign_key: true
      t.timestamps
    end
  end
end
