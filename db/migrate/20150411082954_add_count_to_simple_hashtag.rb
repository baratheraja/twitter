class AddCountToSimpleHashtag < ActiveRecord::Migration
  def change
  	add_column :simple_hashtag_hashtags, :count, :integer
  end
end
