var daysUntilBirthday = 60;

while(daysUntilBirthday > 0) {
  if(daysUntilBirthday === 1) {
    console.log(daysUntilBirthday + " DAY UNTIL MY BIRTHDAY!!!!");
  }
  else if(daysUntilBirthday < 5) {
    console.log(daysUntilBirthday + " DAYS UNTIL MY BIRTHDAY!!!");
  }
  else if (daysUntilBirthday < 30) {
    console.log(daysUntilBirthday + " days until my birthday~!");
  }
  else {
    console.log(daysUntilBirthday + " days until my birthday. Such a long time... :(");
  }
  daysUntilBirthday--;
}

console.log("Go shawty, it's your birthday!");
console.log("We gonna party like it's your birthday!");
console.log("We gonna sip Bacardi like it's your birthday!");
