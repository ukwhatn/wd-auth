class CreateWikidotUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :wikidot_users do |t|
      t.string :uid, null: false, index: { unique: true }
      t.string :name, null: false
      t.timestamps
    end
  end
end
