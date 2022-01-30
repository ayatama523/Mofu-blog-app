class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :categories, id: :uuid do |t|
      t.string :name, null: false
      t.references :category, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
