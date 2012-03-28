class Cases::ActivitiesController < Cases::BaseController

  def update
    #raise params['case'].inspect
    Case.find(params[:id]).activities.create(
      :content       => params['case']['activity']['content'],
      :activity_type => params['case']['activity']['activity_type']
    )

    redirect_to root_path
  end
end
