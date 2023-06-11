
var i = 0;
var y = 0;
function formatNumber(number) {
    const suffixes = ["", " k", " m", " b"]; 
    const magnitude = Math.floor(Math.log10(number) / 3); 
    
    const scaledNumber = number / Math.pow(1000, magnitude); 
    const formattedNumber = scaledNumber.toFixed(1); 
    
    const view = document.getElementsByClassName("view"); 
    let result = formattedNumber + suffixes[magnitude];
    //if result contain a .0 dot remove it
    if (result.includes(".0")) {
        result = result.replace(".0", "");
    }




    view[i].innerHTML = result+" views";
    i++;
  }



  function formatDate(dateString) {
    var currentDate = new Date().toLocaleDateString("fr-FR");
    var targetDate = new Date(dateString).toLocaleDateString("fr-FR");
    const date = document.getElementsByClassName("date");
  
    currentDate = new Date(currentDate);
    currentDate.setHours(0);
    currentDate.setMinutes(0);
    currentDate.setSeconds(0);
  
    targetDate = new Date(targetDate);
    targetDate.setHours(currentDate.getHours());
    targetDate.setMinutes(currentDate.getMinutes());
    targetDate.setSeconds(currentDate.getSeconds());
  

    var timeDiff = targetDate.getTime() - currentDate.getTime() ;

    timeDiff= -timeDiff;
    if (timeDiff < 86400000) {
      var hoursDiff = Math.floor(timeDiff / (1000 * 60 * 60));
      // console.log(hoursDiff);
      result = hoursDiff + " hour(s)";
    }  else if (timeDiff < 86400000) {
      var hoursDiff = Math.floor(timeDiff / (1000 * 60));
      result = hoursDiff + " minute(s)";
    }
    else if (timeDiff < 86400000) {
      var secondeDiff = Math.floor(timeDiff / (1000));
      result = secondeDiff + " second(s)";
    }else if (timeDiff < 86400000) {
      var monthsDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 30));
      result = monthsDiff + " month(s)";
    }else if (timeDiff < 86400000) {
      var anneeDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 30 * 12));
      result = anneeDiff + " year(s)";
    }else {
      var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
      result = daysDiff + " day(s)";
    }
    date[y].innerHTML = " "+ result+" ago";
    y++;
  }
  

  function ToggleShowMessages(element,messages){
    for (let i = 0; i < messages.length; i++) {

      element.innerHTML += messages[i].Content + "<br>";

    }
  }
