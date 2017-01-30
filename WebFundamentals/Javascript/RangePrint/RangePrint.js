function printRange(start, end, skip) {
  if(end === undefined && skip === undefined) {
      end = start;
      start = 0;
      skip = 1;
  }
  else if(skip === undefined) {
    skip = 1;
  }
  if(end < start) {
    for(var i = start; i > end; i -= skip) {
      console.log(i);
    }
  }
  else {
    for(var i = start; i < end; i+= skip) {
      console.log(i);
    }
  }
}

printRange(2, 10, 2);
