if !@auth_user
  json.status 401
else
  json.status "created"
  json.extract! @auth_user ,:email
end
