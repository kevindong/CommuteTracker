class CommutesController < ApplicationController
  def startcommute
    @commute = current_user.commutes.build()
    @commute.startcommute
    if @commute.save
      current_user.hasActiveCommute = true
      current_user.currentCommute = @commute.id
      current_user.save
      flash[:success] = "Commute started!"
      redirect_to root_url
    else
      flash[:success] = "Operation failed!"
      redirect_to root_url
    end
  end
  
  def endcommute
    @commute = Commute.find_by_id(User.find_by_id(params[:id]).currentCommute)
    @commute.endcommute
    @commute.save
    current_user.hasActiveCommute = false
    current_user.currentCommute = nil
    current_user.save
    redirect_to root_url
  end
end
