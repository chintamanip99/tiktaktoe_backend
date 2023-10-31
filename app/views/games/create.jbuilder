if @game
  json.status "Game Created"
  if @game.user1_id == current_user.id
    json.move "O"
  else
    json.move "X"
  end
  json.game_id @game.id
end
