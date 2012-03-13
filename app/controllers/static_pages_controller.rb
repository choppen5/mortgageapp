class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(:page => params[:page])
      @companies_to_post_to = session[:company_ids].map{|c| Company.find(c)}
    end
  end

  def add_company_to_homepage
    session[:company_ids] ||= []
    session[:company_ids] << params[:company_id]
    session[:company_ids].uniq!.sort
    redirect_to root_path
  end

  def help
  end

  def about
  end

  def contact
  end
end
