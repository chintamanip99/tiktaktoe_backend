if !@user || !@token
  json.status 401
else
  json.status "signed_in"
  json.access_token @token
end
