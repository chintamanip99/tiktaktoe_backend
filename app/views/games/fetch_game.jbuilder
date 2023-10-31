if @game
  json.game @game
  if @game.user1_id == current_user.id
    json.move "O"
  else
    json.move "X"
  end
else
  json.game do json.id nil end
end
