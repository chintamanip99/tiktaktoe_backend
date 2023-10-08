import React from "react";
import "./App.css";
import { createGame } from "./services/gameService";
import { createAMove, fetchMoves } from "./services/moveService";
import { getGame } from "./services/gameService";
import { logout } from "./services/loginService";
import { setLoginStatusG } from "./Base";
import consumer from './services/cableService'

export var setMovesInState;

class Grid extends React.Component {
  state = {
    game_id: null,
    move: "X",
    userId: null,
    turn: true,
    1: "",
    2: "",
    3: "",
    4: "",
    5: "",
    6: "",
    7: "",
    8: "",
    9: ""
  };

  initState = {
    game_id: null,
    move: "X",
    userId: null,
    email_user2: null,
    turn: true,
    1: "",
    2: "",
    3: "",
    4: "",
    5: "",
    6: "",
    7: "",
    8: "",
    9: ""
  };


setPosition = (row,column,move) => {

  switch(""+row+column){
    case "11":
      if(!this.state[1]) this.setState({ [1]: move});
    break;
    case "12":
      if(!this.state[2]) this.setState({ [2]: move});
    break;
    case "13":
      if(!this.state[3]) this.setState({ [3]: move});
    break;
    case "21":
      if(!this.state[4]) this.setState({ [4]: move});
    break;
    case "22":
      if(!this.state[5]) this.setState({ [5]: move});
    break;
    case "23":
      if(!this.state[6]) this.setState({ [6]: move});
    break;
    case "31":
      if(!this.state[7]) this.setState({ [7]: move});
    break;
    case "32":
      if(!this.state[8]) this.setState({ [8]: move});
    break;
    case "33":
      if(!this.state[9]) this.setState({ [9]: move});
    break;
  }
}

 token = () => {
  return JSON.parse(atob(sessionStorage.getItem('access_token').split('.')[1]))['sub'];
}

componentDidMount(){

//   this.game_subscription = consumer.subscriptions.create({ channel: "GameChannel", user_id: this.token() }, {  connected() {
//     console.log("Connected to GameChannel");
//   },
//   disconnected() {
//     console.log("Disconnected from GameChannel");
//   },
//   received(data) {
//     console.log("Received message:", data);
//   }
// }
// )
// this.game_subscription.received = (data) =>{
//   console.log(data)
//   this.setState({game_id: data.id},() =>{ this.game_subscription.unsubscribe();})
//   }


  getGame().then(res => {
    if(res && res.data && res.data.game && res.data.game.id){
      this.setState({ game_id: res.data.game.id, move: res.data.move },()=>{
        // this.game_subscription.unsubscribe();
        setMovesInState = ({data:{moves}}) => {
          if(moves.length && this.state.game_id === moves[0].game_id){
            moves.forEach(element => {
              this.setPosition(element.move_row,element.move_column,element.the_move);
            });
          }
        }
        fetchMoves(this.state.game_id);
      });
    }
  })
  .catch(res=>console.log(res))
 
}

componentDidUpdate(prevProps, prevstate){
  if(this.state.game_id !== prevstate.game_id){
    this.subscription = consumer.subscriptions.create({ channel: "MoveChannel", game_id: this.state.game_id }, {  connected() {
      console.log("Connected to MoveChannel");
    },
    disconnected() {
      console.log("Disconnected from MoveChannel");
    },
    received(data) {
      console.log("Received message:", data);
    }
  }
  )
  this.subscription.received = (data) =>{
    if(data.game_id === this.state.game_id){
      this.setPosition(data.move_row,data.move_column,data.the_move)
      if(data.the_move !== this.state.move) this.setState({turn: true})
    }
  }
  }
}

componentWillUnmount(){
  this.subscription.unsubscribe();
  // this.game_subscription.unsubscribe();
}

  onClickBox = (position) => {
    const game_id = this.state.game_id;
    if(this.state.turn){
    this.setState( { turn: false } ,()=>{
    switch (position) {
      
      case 1:
        if(!this.state[1]) createAMove(game_id,this.state.move,1,1)
        else this.setState({turn: true})
        break;
      case 2:
        if(!this.state[2]) createAMove(game_id,this.state.move,1,2)
        else this.setState({turn: true})
        break;
      case 3:
        if(!this.state[3]) createAMove(game_id,this.state.move,1,3)
        else this.setState({turn: true})
        break;
      case 4:
        if(!this.state[4]) createAMove(game_id,this.state.move,2,1)
        else this.setState({turn: true})
        break;
      case 5:
        if(!this.state[5]) createAMove(game_id,this.state.move,2,2)
        else this.setState({turn: true})
        break;
      case 6:
        if(!this.state[6]) createAMove(game_id,this.state.move,2,3)
        else this.setState({turn: true})
        break;
      case 7:
        if(!this.state[7]) createAMove(game_id,this.state.move,3,1)
        else this.setState({turn: true})
        break;
      case 8:
        if(!this.state[8]) createAMove(game_id,this.state.move,3,2)
        else this.setState({turn: true})
        break;

      case 9:
        if(!this.state[9]) createAMove(game_id,this.state.move,3,3)
        else this.setState({turn: true})
        break;
    }});
  }
  };

  handleChange = (event) => {
    this.setState({ email_user2: event.target.value });
  };

  handleOnClick = () => {
    createGame(this.state.email_user2).then(res =>  

      {
        this.setState({ game_id: res.data.game_id, move: res.data.move },()=> {
          // this.game_subscription.unsubscribe();
        })
      })
  };

  clearSession = () => {
    return logout().then(res => { 
      sessionStorage.clear();
      setLoginStatusG(false); 
      return res.data.message;
     }).catch(res => { 
        console.log(res)
      })
  }

  newGame = () => {
    this.setState(this.initState,()=>{
      this.subscription.consumer.disconnect();
      this.game_subscription.consumer.disconnect();
    });
  }

  render() {
    return (
      <>
        <button onClick={() =>{ this.clearSession().then((string) => alert(string))}}>Logout</button>
        <button onClick={ this.newGame }>New Game</button>
        { !this.state.game_id && (
          <div className="form-container">
            <label className="font-class">Opponent's Email:</label>
            <input
              type="text"
              id="email"
              name="email"
              onChange={this.handleChange}
              placeholder="Opponent's Email"
            />
            <input type="submit" value="Submit" onClick={this.handleOnClick} />
          </div>
        )}
        {this.state.game_id && (
          <div className="game-board">

            <div className="box" onClick={() => this.onClickBox(1)}>
              {this.state[1]}
            </div>

            <div className="box" onClick={() => this.onClickBox(2)}>
              {this.state[2]}
            </div>

            <div className="box" onClick={() => this.onClickBox(3)}>
              {this.state[3]}
            </div>

            <div className="box" onClick={() => this.onClickBox(4)}>
              {this.state[4]}
            </div>

            <div className="box" onClick={() => this.onClickBox(5)}>
              {this.state[5]}
            </div>

            <div className="box" onClick={() => this.onClickBox(6)}>
              {this.state[6]}
            </div>

            <div className="box" onClick={() => this.onClickBox(7)}>
              {this.state[7]}
            </div>

            <div className="box" onClick={() => this.onClickBox(8)}>
              {this.state[8]}
            </div>

            <div className="box" onClick={() => this.onClickBox(9)}>
              {this.state[9]}
            </div>
            
          </div>
        )}
      </>
    );
  }
}
export default Grid;
