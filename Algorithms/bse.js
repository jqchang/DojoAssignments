function BSE(str) {
  var pieces = str.split("?");
  if(pieces[0].length === str.length) {
    return pieces;
  }
  else {
    return BSE(pieces[0]+"0"+pieces.slice(1,pieces.length).join("?")).concat(BSE(pieces[0]+"1"+pieces.slice(1,pieces.length).join("?")));
  }
}

console.log(BSE("??????"))
