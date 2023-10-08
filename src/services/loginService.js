import axios from "axios";

export async function login(email,password) {
    try {
      const response = await axios.post(`http://${process.env.REACT_APP_API_DOMAIN}/users/sign_in`,
      {
        email,
        password
      }, { headers: {"Access-Control-Allow-Credentials": true, 'Accept': 'application/json','Content-Type': 'application/json'} }
      );
      return response
    } catch (error) {
      console.error(error);
      alert("Our appologies!,Some technical problem occured login")
    }
  }

export async function logout(){
  try {
    const response = await axios.delete(`http://${process.env.REACT_APP_API_DOMAIN}/users/sign_out`, { headers: {"Access-Control-Allow-Credentials": true, 'Accept': 'application/json','Content-Type': 'application/json','Authorization': 'Bearer '+sessionStorage.getItem('access_token')} }
    );
    return response
  } catch (error) {
    console.error(error);
    alert("Our appologies!,Some technical problem occured logout")
  }
}