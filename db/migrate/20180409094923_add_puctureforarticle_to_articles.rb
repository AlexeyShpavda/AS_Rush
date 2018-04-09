class AddPuctureforarticleToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :pictureforarticle, :string
  end
end
