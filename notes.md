Project Planning:

-need a welcome page as root route



potential methods versions:

def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
        signin_and_redirect @user
    else
        flash[:error] = "There was a problem....etc"
        redirect_to new_user_registration_url
    end
end

def failure
    flash[:error] = "There was a problem signing you in. Pls register or try again later."
    redirect_to new_user_registration_url
end


 if params[:category_id]
        @movies = current_user.movies.find_by(category_id: params[:category_id])
       else
        @movies = current_user.movies
       end