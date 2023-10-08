import "./App.css";
import Grid from "./Grid";
import LoginForm from "./LoginForm";
import { useState,useEffect } from "react";
import actionCable from 'actioncable';
import Spinner from './spinner.gif';
// import * as serviceWorker from './serviceWorker'

export var setIsLoadingG, setLoginStatusG;

export default () => {

  // const cableApp={}

  // cableApp.cable=actionCable.createConsumer('ws://localhost:3000/cable')

  const [isLoggedIn, setLoginStatus] = useState(sessionStorage.getItem('access_token') ? true : false);
  const [isLoading, setIsLoading] = useState(false);

  setIsLoadingG = setIsLoading;
  setLoginStatusG = setLoginStatus;

  return (
    <div className="App">
      { isLoggedIn ? !isLoading && <Grid /> : !isLoading && <LoginForm /> }
      { isLoading && <img style= {{height: "100vh", width: "100vw"}} src = {Spinner} /> }
    </div>
  );
};