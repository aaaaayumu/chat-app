class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreigh_key: true
      t.references :room, null: false, foreigh_key: true
      t.string :content
      t.timestamps
    end
  end
end
