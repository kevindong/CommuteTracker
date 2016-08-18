class CommutesController < ApplicationController
  def startcommute
    debugger
    @commute = current_user.commutes.build()
    begin
      @commute.startcommute(params[:routeId])
    rescue
      flash[:error] = "An error occured. Do you already have a commute active?"
      @commute.destroy
      return redirect_to root_url
    end
    if @commute.save
      current_user.hasActiveCommute = true
      current_user.currentCommute = @commute.id
      current_user.save
      flash[:success] = "Commute started!"
      redirect_to root_url
    else
      flash[:error] = "Operation failed!"
      redirect_to root_url
    end
  end
  
  def endcommute
    @commute = Commute.find_by_id(current_user.currentCommute)
    begin
      @commute.endcommute(params[:routeId])
    rescue
      flash[:error] = "An error occured. Are you trying to end someone else's commute?"
      return redirect_to root_url
    end
    if @commute.save
      current_user.hasActiveCommute = false
      current_user.currentCommute = nil
      if current_user.save
        flash[:success] = "Commute ended!"
        redirect_to root_url
      else
        flash[:error] = "Operation failed!"
        redirect_to root_url
      end
    else
      flash[:error] = "Operation failed!"
      redirect_to root_url
    end
  end
  
  def destroy
    commute = Commute.find_by_id(params[:id].to_i)
    if commute.nil?
      flash[:error] = "The selected commute does not exist."
    elsif (commute.user_id == current_user.id)
      current_user.hasActiveCommute = false
      current_user.currentCommute = nil
      if !current_user.save
        flash[:error] = "An error occured while changing your properties."
        redirect_to root_url
      end
      commute.destroy
      flash[:success] = "Commute destroyed!"
    else
      flash[:error] = 'You\'re not authorized to delete Commute #' + commute.id.to_s
    end
    redirect_to root_url
  end
  
  def show
    @commute = Commute.find_by_id(params[:id].to_i)
  end
end