if @user
  json.status 200
  json.message "User "+@user.email+" logged out successfully."
else
  json.message "User not logged in"
end
