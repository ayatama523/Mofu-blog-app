class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :posts, id: :uuid do |t|
      t.string :title, null: false
      t.text :content_html
      t.text :content_json
      t.references :creator, type: :uuid, null: false, foreign_key: { to_table: :users }
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
