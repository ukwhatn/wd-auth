class CreateGithubUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :github_users do |t|
      t.string :uid, null: false, index: { unique: true }
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.timestamps
    end
  end
end