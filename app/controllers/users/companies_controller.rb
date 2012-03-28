class Users::CompaniesController < Users::BaseController

  # GET /companies/1/edit
  def edit
    if params[:delete]
      session[:company_ids] = []
      redirect_to companies_path
    else
      session[:company_ids] ||= []
      session[:company_ids] << params[:company_id]
      redirect_to root_path
    end


  end
end
