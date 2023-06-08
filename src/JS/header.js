function formatNumber(number) {
    const suffixes = ["", "k", "M", "MD"]; // Suffixes correspondant à chaque tranche de valeur
    const magnitude = Math.floor(Math.log10(number) / 3); // Détermination de la tranche de valeur
    
    const scaledNumber = number / Math.pow(1000, magnitude); // Réduction du nombre à une échelle appropriée
    const formattedNumber = scaledNumber.toFixed(1); // Formatage du nombre avec une décimale
    
    console.log(formattedNumber + suffixes[magnitude])  // Concaténation du nombre formaté et du suffixe
  }