class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :client_admin, null: false, foreign_key: true
      t.string :uuid, null: false, index: { unique: true }
      t.string :secret, null: false
      t.string :redirect_uri, null: false
      t.boolean :force_pkce, null: false, default: false
      t.timestamps
    end
  end
end
