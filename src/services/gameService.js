import axios from "axios";

export async function createGame(email_user2) {
  try {
    // headers: {
    //     "Content-Type": "application/json",
    //     'X-Requested-With': 'XMLHttpRequest',
    //     'X-CSRF-Token': token
    //   }
    const response = await axios.post(`http://${process.env.REACT_APP_API_DOMAIN}/game`, {
        dimensions: 3,
        email_user2
      },{ headers: {"Access-Control-Allow-Credentials": true, 'Accept': 'application/json','Content-Type': 'application/json','Authorization': 'Bearer '+sessionStorage.getItem('access_token')} }
    );
    return response;
  } catch (error) {
    console.error(error);
    alert("Our appologies!,Some technical problem occured createGame");
  }
}

export async function getGame() {
  try {
    const response = await axios.get(`http://${process.env.REACT_APP_API_DOMAIN}/fetch_game`, 
    {headers: {
      "Access-Control-Allow-Credentials": true, 
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '+sessionStorage.getItem('access_token')
    }}
    );
    return response;
  } catch (error) {
    console.error(error);
    alert("Our appologies!,Some technical problem occured getGame");
  }
}

export async function getGames() {
  try {
    const response = await axios.get(`http://${process.env.REACT_APP_API_DOMAIN}/fetch_games`, 
    {headers: {
      "Access-Control-Allow-Credentials": true, 
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '+sessionStorage.getItem('access_token')
    }}
    );
    return response;
  } catch (error) {
    console.error(error);
    alert("Our appologies!,Some technical problem occured getGame");
  }
}

// headers: {
//     "Content-Type": "application/json",
//     'X-Requested-With': 'XMLHttpRequest',
//     'X-CSRF-Token': token
//   }