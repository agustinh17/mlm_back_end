module AuthHelper
  def http_login
    user = 'andy'
    pw = 'thering'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,pw)
  end  
end

