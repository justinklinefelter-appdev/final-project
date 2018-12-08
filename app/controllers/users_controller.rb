class UsersController < ApplicationController
  

def show

    @user = User.all
@users = User.find(params.fetch("id_to_display"))
  

 
    
    render("user_templates/show.html.erb")
  
end

end