window.addEventListener("load",calculationProfit);

function calculationProfit(){
  const priceForm = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceForm.addEventListener("change",() =>{
    let price = priceForm.value
    tax.innerHTML = Math.round(price * 0.1);
    profit.innerHTML = price - tax.innerHTML  
  });
}
