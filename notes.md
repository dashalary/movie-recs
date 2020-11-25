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


(welcome page)
 <%= link_to "Sign In", new_user_session_path, class: "btn btn-primary" %><br>
    <%= link_to "Sign Up", new_user_registration_path, class: "btn btn-primary" %>