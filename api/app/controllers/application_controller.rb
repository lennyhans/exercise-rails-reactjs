class ApplicationController < ActionController::API
    # this are not included in API subset
    # http://stackoverflow.com/questions/31081223
    include ActionController::HttpAuthentication::Basic::ControllerMethods
    #include ActionController::HttpAuthentication::Token::ControllerMethods
end
