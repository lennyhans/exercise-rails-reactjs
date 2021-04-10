module AuthenticationConcern  
    extend ActiveSupport::Concern
    included do
        before_action :authenticate
    end
  
    def authenticate
    if request.headers["Authorization"] == nil
        return render json: { message: "Basic Authorization was expected" }, status: 401
    end
    if user = authenticate_with_http_basic { |u, p| 
        if u == nil 
        return render json: { message: "User was expected" }, status: 400
        end
        if p == nil
        return render json: { message: "Password was expected" }, status: 400
        end

        account = Account.find_by(username: u, password: p) 
        # return false
        # return account != nil
        if account == nil
        return render json: { message: "User or Password invalid"}, status: 401
        end
        # return render json: { message: "OK", user:u, pass:p, account:account}, status: 200
        return true
    }
        #return true
    else
        return render json: { message: "User or Password invalid out"}, status: 401
    end

    #return render json: { message: "SEEMS OK", auth: request.headers["Authotization"], user: user}, status: 200

    end
end