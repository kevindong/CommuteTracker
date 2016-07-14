class CommutesController < ApplicationController
  def create
    @commute = current_user.commutes.build(starttime: Time.now)
    if @commute.save
      current_user.hasActiveCommute = true
      current_user.save
      flash[:success] = "Commute started!"
      redirect_to root_url
    else
      flash[:success] = "Operation failed!"
      redirect_to root_url
    end
  end
end
