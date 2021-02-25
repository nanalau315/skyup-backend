class ApplicationController < ActionController::API
    
    def authenticate
        auth_header = request.headers["Authorization"]
        token = auth_header.split.last
        payload = JWT.decode(token, "5KyuPy0uR5ky6yn4n414u", true, {algorithm: 'HS256'})[0]
        @current_user = User.find(payload["user_id"])
    end

end
