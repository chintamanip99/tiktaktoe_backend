if @game
  json.status "game_created"
  json.game_id @game.id
end