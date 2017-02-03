var NUM_DECIMALS = 2;
var API_KEY = "d24a7c6783dea0420c4b1cfa81050e0d";

function convertedTemp(temp, unit) {
  if(unit == "F") {
    return Number(temp)*(9/5)-459.67;
  }
  else if(unit == "C") {
    return Number(temp)-273.15;
  }
  else {
    console.log("No units!");
    return false;
  }
}

$(document).ready(function() {
  $("#unit_f").attr("checked", true);
  $("form").submit(function() {
    var query = $("#query").val();
    var unit = $('input[name=units]:checked').val();
    if(!unit || query==="Enter a city..."){
      alert("Please enter search info!");
      $("form")[0].reset();
      return false;
    }
    else {
      var url = "http://api.openweathermap.org/data/2.5/weather?q="+query+"&appid="+API_KEY;
      $.get(url, function(data) {
        $("#weather h1").html("City: " + data.name[0].toUpperCase() + data.name.substring(1));
        $("#weather p").html("Temperature: " + convertedTemp(data.main.temp, unit).toFixed(NUM_DECIMALS) + "&deg;" + unit);
        $("#weather").css("display", "block");
        $("form")[0].reset();
        $("input[type=text]").css("color","#dddddd");
        return false;
      }, "json");
      return false;
    }
  });
  $('input').focusin(function(){
    if($(this).val() === $(this).attr('default')) {
      $(this).val("");
      $(this).css("color","black");
    }
  });
  $('input').focusout(function(){
    if($(this).val() === "" && $(this).attr("type") !== "submit") {
      $(this).css("color","#dddddd");
      $(this).val($(this).attr("default"));
    }
  });
});
