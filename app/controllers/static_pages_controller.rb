class StaticPagesController < ApplicationController
  def home
  	if logged_in?
      @hashtags = SimpleHashtag::Hashtag.all
      
    #creating a view based on number of tweets
      sql=" create or replace view counts as select hashtag_id,count(hashtag_id) as count from simple_hashtag_hashtaggings group by hashtag_id order by count DESC"
  	ActiveRecord::Base.connection.execute(sql)
      sql="select * from counts LIMIT 5"
      @result=ActiveRecord::Base.connection.execute(sql)
      @res= @result.each(:as => :hash) do |row| 
      puts row
      end
      @micropost = current_user.microposts.build if logged_in?
  	  @feed_items = current_user.feed
  	end
  end

  def help
  end

  def about
  end
end
