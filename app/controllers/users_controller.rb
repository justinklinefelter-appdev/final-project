class UsersController < ApplicationController
  

def show
 @results = Result.all
    @user = User.all
    @race = Race.all
  
    @users = User.find(current_user.id)
   @order = Result.order('created_at DESC')
    
    render("user_templates/show.html.erb")
  
end
end