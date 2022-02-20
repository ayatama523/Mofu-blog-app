class AddContentCssToPosts < ActiveRecord::Migration[6.1]
  def change
    change_table :posts, bulk: true do |t|
      t.text :content_css
    end
  end
end
