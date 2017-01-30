var HOUR = 8;
var MINUTE = 50;
var PERIOD = "PM";

function convertTo24Hr(hr, per) {
  if(per != "PM" && per != "AM") {
    console.log("Invalid time!");
    return "Invalid time";
  }
  return (hr%12)+12*(per === "PM");
}

function morningEvening(hr, min) {
  if(hr === 0 && min === 0) {
    return "midnight.";
  }
  else if(hr === 12 && min === 0) {
    return "noon.";
  }
  else if (hr < 6) {
    return "in the early morning.";
  }
  else if (hr >= 6 && hr < 12) {
    return "in the morning.";
  }
  else if (hr >= 12 && hr < 16) {
    return "in the afternoon.";
  }
  else if (hr >= 16 && hr < 19) {
    return "in the evening.";
  }
  else if (hr >= 19 && hr < 24) {
    return "at night.";
  }
  else {
    return "unknown time of day -- " + [hr,min];
  }
}

function relativeString(hr, min) {
  if (min == 5) {
    return "It's 5 after " + hr;
  }
  else if (min == 15) {
    return "It's quarter after " + hr;
  }
  else if (min == 30) {
    return "It's half past " + hr;
  }
  else if(min < 30) {
    return "It's just after " + hr;
  }
  else if (min > 30) {
    return "It's almost " + (hr+1);
  }

}

function main() {
  console.log(relativeString(HOUR, MINUTE), morningEvening(convertTo24Hr(HOUR, PERIOD), MINUTE));
}

main();
