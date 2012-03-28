class CasesController < ApplicationController

  def update

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @company }
    end
  end
end
