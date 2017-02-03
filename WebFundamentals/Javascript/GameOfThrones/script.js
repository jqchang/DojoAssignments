var house_url = "https://anapioficeandfire.com/api/houses/";

$(document).ready(function() {
  $(".houses img").hover(function() {
    $(this).css("border","2px red solid");
  }, function() {
    $(this).css("border","2px black solid");
  });

  $("img").click(function() {
    console.log("Loading" + $(this).attr("id"));
    $.get(house_url+$(this).attr("id"), {origin: ""}, function(res) {
      // without {origin: ""}, server gives XMLHTTPrequest errors for Stark and Targaryen
      var boxtext = "";
      boxtext += "<p>Name: " + res.name + "</p>";
      boxtext += "<p>Words: " + res.words + "</p>";
      boxtext += "<p>Titles: ";
      for(var i = 0; i < res.titles.length; i++) {
        boxtext += res.titles[i];
        boxtext += ", ";
      }
      boxtext = boxtext.substring(0,boxtext.length-2);
      boxtext += "</p>";
      $("#info").html(boxtext);
    }, "json");
  });
});
