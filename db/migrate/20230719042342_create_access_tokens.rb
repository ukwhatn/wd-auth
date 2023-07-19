class CreateAccessTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :access_tokens do |t|
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :scopes
      t.timestamps
    end
  end
end
