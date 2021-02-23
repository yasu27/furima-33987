window.addEventListener('load', () => {
  console.log("OK");

  // 金額を入力した数値をpriceInputという変数に格納する
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const SalesCommission = Math.floor(inputValue * 0.1);
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = SalesCommission // Math.floor( 195 * 0.1)
  const PriceContent = document.getElementById("profit");
  PriceContent.innerHTML = Math.floor( inputValue - SalesCommission)
})
});

