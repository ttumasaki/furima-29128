function tax (){
  const priceInput = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = inputValue * 0.1;
    const fee = inputValue - tax;
    taxPrice.innerHTML = Math.floor(tax);
    profit.innerHTML = Math.floor(fee)
  })
}

window.addEventListener("load",tax)
