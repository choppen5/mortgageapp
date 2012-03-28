class Users::CasesController < Users::BaseController

  def update
    current_user.cases.create(
      :description => params['user']['case']['description'],
      :status => params['user']['case']['status'],
      :company_id => params['user']['case']['company_id']
    )

    redirect_to root_path
  end
end
