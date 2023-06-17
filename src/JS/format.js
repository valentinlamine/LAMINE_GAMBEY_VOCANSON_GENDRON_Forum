
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

  function ToggleShowMessages(element,messages){
    for (let i = 0; i < messages.length; i++) {

      element.innerHTML += messages[i].Content + "<br>";
    }
  }

  function formatRelativeTime(element) {
    const date = new Date(element.innerHTML);
    date.setHours(date.getHours() - 2);
    const now = new Date();
    const diff = now - date;
    const seconds = Math.floor(diff / 1000);
    const minutes = Math.floor(seconds / 60);
    const hours = Math.floor(minutes / 60);
    const days = Math.floor(hours / 24);

    if (days > 0) {
        element.innerHTML = days + " days ago";
    } else if (hours > 0) {
        element.innerHTML = hours + " hours ago";
    } else if (minutes > 0) {
        element.innerHTML = minutes + " minutes ago";
    } else {
        element.innerHTML = seconds + " seconds ago";
    }
}