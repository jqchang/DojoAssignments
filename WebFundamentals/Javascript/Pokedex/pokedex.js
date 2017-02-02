$(document).ready(function() {
  $("#landing").css("display", "inline-block");
  var NUM_POKEMON = 151; // 718 for full gen 6 pokedex

  for(var i = 1; i<=NUM_POKEMON; i++) {
    $("#wrapper").append(
      "<img src=\"http://pokeapi.co/media/img/"+i+".png\">"
    );
  }

  $(document).on("click", "#wrapper img", function() {
    $("#landing").hide();
    $("#dex").hide();
    $("#loading").show();
    $("#loading").css("display", "inline-block");
    var urlstr = $(this).attr("src");
    var i = Number(urlstr.substring(28, urlstr.length-4));
    // console.log("Loading...");
    $.get("http://pokeapi.co/api/v1/pokemon/"+i, function(data) {
      // console.log("Name: " + data.name);

      /* Picture, name, types, size */
      $("#dex img").attr("src", urlstr);
      $("#dex h1").text("#"+data.pkdx_id+": "+data.name);
      $("#types li:nth-child(1)").text("Type 1: " + data.types[0].name[0].toUpperCase() + data.types[0].name.substring(1));
      if(data.types[1] != undefined) {
        $("#types li:nth-child(2)").text("Type 2: " + data.types[1].name[0].toUpperCase() + data.types[1].name.substring(1));
      }
      else {
        $("#types li:nth-child(2)").text("");
      }
      $("#size li:nth-child(1)").text("Height: " + data.height);
      $("#size li:nth-child(2)").text("Weight: " + data.weight);

      /* Abilities */
      for(var i = 0; i < 3; i++) {
        var abilitystring = "";
        if(data.abilities[i]) {
          abilitystring += data.abilities[i].name[0].toUpperCase() + data.abilities[i].name.substring(1);
        }
        else {
          abilitystring = "";
        }
        $("#abilities li:nth-child("+Number(i+1)+")").text(abilitystring);
      }

      /* Stats */
      var stats = [data.hp, data.attack, data.defense, data.sp_atk, data.sp_def, data.speed];
      for(var i = 0; i < 6; i++) {
        $("#stats tr:nth-child("+Number(i+1)+") td:nth-child(2)").text(stats[i]);
        $("#stats tr:nth-child("+Number(i+1)+") td:nth-child(3)").css("width", stats[i]);
        $("#stats tr:nth-child("+Number(i+1)+") td:nth-child(3)").css("border-top", "2px red solid");
        $("#stats tr:nth-child("+Number(i+1)+") td:nth-child(3)").css("border-bottom", "2px red solid");
      }
      /* Show panel after loading is finished */
      $("#loading").css("display", "none");
      $("#dex").show();
      $("#dex").css("display", "inline-block");
    });
  });
});
