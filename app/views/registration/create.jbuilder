if !@user
  json.status 401
else
  json.status "signed_up"
end