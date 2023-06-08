
var i = 0;
function formatNumber(number) {
    const suffixes = ["", "k", "M", "MD"]; 
    const magnitude = Math.floor(Math.log10(number) / 3); 
    
    const scaledNumber = number / Math.pow(1000, magnitude); 
    const formattedNumber = scaledNumber.toFixed(1); 
    
    const view = document.getElementsByClassName("view"); 
    let result = formattedNumber + suffixes[magnitude];
    view[i].innerHTML = result;
    i++;
  }

  function calculateDaysSince(dateString) {
    var currentDate = new Date();
    var targetDate = new Date(dateString);
    console.log(currentDate);
    console.log(targetDate);
  
    // Convertir currentDate en 000Z (heure à 00:00:00)
    currentDate.setHours(0);
    currentDate.setMinutes(0);
    currentDate.setSeconds(0);
  
    // Définir l'heure, les minutes et les secondes de la date cible avec la date actuelle
    targetDate.setHours(currentDate.getHours());
    targetDate.setMinutes(currentDate.getMinutes());
    targetDate.setSeconds(currentDate.getSeconds());
  
    var timeDiff = currentDate.getTime() - targetDate.getTime();
  
    if (timeDiff < 0) {
      return "La date cible est dans le futur";
    } else if (timeDiff < 86400000) { // Si moins d'un jour (86400000 ms = 1 jour)
      var hoursDiff = Math.floor(timeDiff / (1000 * 60 * 60)); // Convertir en heures
      return hoursDiff + " heure(s)";
    } else {
      var daysDiff = Math.floor(timeDiff / (1000 * 60 * 60 * 24)); // Convertir en jours
      return daysDiff + " jour(s)";
    }
  }
  
  // Exemple d'utilisation
  var date = "2023-06-08 10:58:27 +0000 UTC";
  var result = calculateDaysSince(date);
  console.log(result);
  
  
  
  

