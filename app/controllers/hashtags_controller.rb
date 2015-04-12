class HashtagsController < ApplicationController
  #Shows list of all hashtags
  def index
    @hashtags = SimpleHashtag::Hashtag.all
  end
  #Display hashtag by name
  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end
end