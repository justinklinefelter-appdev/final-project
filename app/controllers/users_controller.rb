class UsersController < ApplicationController
  

def show
 @results = Result.all
    @user = User.all
    @race = Race.all
  
    @users = User.find(current_user.id)
   
    
    render("user_templates/show.html.erb")
  
end
end