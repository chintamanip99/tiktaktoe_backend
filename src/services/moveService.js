import axios from "axios";
import { setMovesInState } from "../Grid";

export async function createAMove(game_id,move_name,move_row,move_column) {
    try {
      const response = await axios.post(`http://${process.env.REACT_APP_API_DOMAIN}/move/`,
      
      {
          game_id,move_name,move_column,move_row
      }, 
      {headers: {
        "Access-Control-Allow-Credentials": true, 
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer '+sessionStorage.getItem('access_token')
      }}
      );
      return response
    } catch (error) {
      alert("Our appologies!,Some technical problem occured createAMove")
    }
  }

  export async function fetchMoves(game_id) {
    try {
      const response = await axios.get(`http://${process.env.REACT_APP_API_DOMAIN}/fetch_moves?game_id=${game_id}`,
      {headers: {
        "Access-Control-Allow-Credentials": true, 
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer '+sessionStorage.getItem('access_token')
      }}
      );
      setMovesInState(response);
      return response
    } catch (error) {
      console.log(error)
      alert("Our appologies!,Some technical problem occured fetchMoves")
    }
  }