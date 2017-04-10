var arr = [
  [0,0,0,0,0],
  [1,1,0,0,0],
  [0,1,0,0,0],
  [0,0,0,0,0],
  [0,0,0,0,0]
];

function pathfind(startX, startY, endX, endY, board, steps, closed) {
  console.log("running", startX, startY);
  if(startX == endX && startY == endY) {
    return steps;
  }
  else if(startX < 0 || startX >= board[0].length || startY < 0 || startY >= board[0].length) {
    return false;
  }
  else if(board[startY][startX] == 1 || closed.includes([startX, startY])) {
    return false;
  }
  else {
    closed.push([startX, startY]);
    console.log(closed.includes([0,0]));
    console.log(closed);
    var moves = [];
    if(!closed.includes([startX-1,startY])){
      moves.push(pathfind(startX-1, startY, endX, endY, board, steps+1, closed));
    }
    if(!closed.includes([startX+1,startY])){
      moves.push(pathfind(startX+1, startY, endX, endY, board, steps+1, closed));
    }
    if(!closed.includes([startX,startY-1])){
      moves.push(pathfind(startX, startY-1, endX, endY, board, steps+1, closed));
    }
    if(!closed.includes([startX,startY+1])){
      moves.push(pathfind(startX, startY+1, endX, endY, board, steps+1, closed));
    }
    var min = moves[0];
    var minIndex = 0;
    for(var i = 0; i < moves.length; i++) {
      if(min === false) {
        min = moves[i];
      }
      if(min !== false && moves[i] < min) {
        min = moves[i];
        minIndex = i;
      }
    }
    return(moves[minIndex]);
  }
}

console.log(pathfind(0,0,0,1,arr,0, []));
