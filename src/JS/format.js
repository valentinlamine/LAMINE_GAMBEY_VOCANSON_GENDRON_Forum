
var i = 0;
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













  function calculateDaysSince(dateString) {
    var currentDate = new Date();
    var targetDate = new Date(dateString);
    console.log(currentDate);
    console.log(targetDate);
  
    currentDate.setHours(0);
    currentDate.setMinutes(0);
    currentDate.setSeconds(0);
  
    targetDate.setHours(currentDate.getHours());
    targetDate.setMinutes(currentDate.getMinutes());
    targetDate.setSeconds(currentDate.getSeconds());
  
    var timeDiff = currentDate.getTime() - targetDate.getTime();
  
    if (timeDiff < 0) {
      return "La date cible est dans le futur";
    } else if (timeDiff < 86400000) {
      var hoursDiff = Math.floor(timeDiff / (1000 * 60 * 60));
      return hoursDiff + " heure(s)";
    } else {
      var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
      return daysDiff + " jour(s)";
    }
  }
  

  
  
  

