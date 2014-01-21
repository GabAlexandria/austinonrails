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
      t.string :browser_title
      t.string :menu_title
      t.text :meta_description
      t.string :meta_keywords
      t.boolean :display_in_menu, null: false, default: true
      t.boolean :draft, null: false, default: true
      t.string :parent_page_id

      t.timestamps
    end

    add_index :pages, :slug, unique: true
    add_index :pages, :parent_page_id

    create_table :photos do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :album_id
      t.boolean :featured, null: false, default: false

      t.timestamps
    end

    add_index :photos, :album_id

    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :url
      t.boolean :featured, null: false, default: false

      t.timestamps
    end

    create_table :users do |t|
      ## Database authenticatable
      t.string :name
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
