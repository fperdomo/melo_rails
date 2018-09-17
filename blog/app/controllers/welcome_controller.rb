class WelcomeController < ApplicationController
  def index
  end

  def dashboard
  	@articles = Article.all
  end

  def report
    dateSelect = params[:filter].to_date
    users = User.all
    startDate = dateSelect.beginning_of_day
    endDate = dateSelect.end_of_day
    comments = Comment.all.where('created_at BETWEEN ? AND ?',startDate,endDate)
    users.each do |user|
      UserMailMailer.sendReport(user, comments, dateSelect).deliver
    end
    redirect_to dashboard_path
  end 

end
