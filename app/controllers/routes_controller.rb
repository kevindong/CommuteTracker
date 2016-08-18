class RoutesController < ApplicationController  
  def createroute
    @route = current_user.routes.build()
    if (is_float(params[:startLat]) && is_float(params[:startLon]) && is_float(params[:endLat]) && is_float(params[:endLon]))
      @route.create(params[:name], params[:startLat].to_f, params[:startLon].to_f, params[:endLat].to_f, params[:endLon].to_f)
      if @route.save
        flash[:success] = "Route saved!"
      else
        flash[:error] = "Route saving failed!"
      end
    else
      flash[:error] = "Inputted coordinates are invalid."
    end
    redirect_to root_url
  end
  
  private    
    def is_float(input)
      begin
        Float(input)
        return true
      rescue
        return false
      end
    end
end