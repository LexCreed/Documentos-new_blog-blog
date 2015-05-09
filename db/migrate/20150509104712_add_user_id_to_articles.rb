class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user, :refernces
  end
end
