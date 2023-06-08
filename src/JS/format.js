
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
    console.log(i);
  }