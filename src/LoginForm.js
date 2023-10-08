import { login } from "./services/loginService";
import { useState } from "react";
import { setIsLoadingG, setLoginStatusG } from "./Base";


export var func1;

export default () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const handleChange = (event) => {
    if (event.target.name === "email") setEmail(event.target.value);

    if (event.target.name === "password") setPassword(event.target.value);
  };

   const  handleOnClick = () => {
    setIsLoadingG(true);
    login(email, password).then((response)=>{
      if(response.data && response.data.status === "signed_in"){
        sessionStorage.setItem('access_token',response.data.access_token);
        setLoginStatusG(true);
        setIsLoadingG(false);
      }else{
        alert("Wrong credentials entered")
      }
    })

  
  };

  return (
    <div className="form-container">
      <label className="font-class">Login</label>
      <input
        type="text"
        id="email"
        name="email"
        onChange={handleChange}
        placeholder="Your email id.."
      />

      <input
        type="password"
        id="password"
        name="password"
        onChange={handleChange}
        placeholder="Your password.."
      />

      <input type="submit" value="Submit" onClick={handleOnClick} />
    </div>
  );
};
