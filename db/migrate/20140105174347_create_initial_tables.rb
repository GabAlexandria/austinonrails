class CreateInitialTables < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.text :side_content
      t.text :side_content2
      t.string :browser_title
      t.string :menu_title
      t.text :meta_description
      t.string :meta_keywords
      t.boolean :display_in_menu, null: false, default: true
      t.string :parent_page_id

      t.timestamps
    end

    add_index :pages, :slug, uniqueness: true
    add_index :pages, :parent_page_id

    create_table :photos do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :album_id

      t.timestamps
    end

    add_index :photos, :album_id

    create_table :settings do |t|
      t.string :name
      t.text :description
      t.references :settable, polymorphic: true

      t.timestamps
    end

    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
