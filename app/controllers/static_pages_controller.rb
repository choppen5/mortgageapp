class StaticPagesController < ApplicationController

  def dashboard
    set_companies_to_post_to
  end
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @companies_to_post_to ||= []
      if session[:company_ids]
        @companies_to_post_to = session[:company_ids].map{|c| Company.find(c)}
      end 
    end
  end

  def help
  end

  def about
  end

  def contact
  end

private
  def set_companies_to_post_to
    @companies_to_post_to ||= []
    if session[:company_ids]
      @companies_to_post_to = session[:company_ids].map{|c| Company.find(c)}
    end
  end
end
