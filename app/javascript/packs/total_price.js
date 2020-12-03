const startDateInput = document.getElementById('rental_start_date');
const endDateInput = document.getElementById('rental_end_date');
const totalPrice = document.getElementById('total_price');
const pricePerDay = document.getElementById('price_per_day');

console.log('total_price.js is loaded');

const calculatePrice = (startDateInput, endDateInput, pricePerDay) => {
  // all three variables are elements
  const startDate = Date.parse(startDateInput.value);
  const endDate = Date.parse(endDateInput.value);
  const days = (endDate - startDate + 86400000) / 86400000;
  const price = days * Number.parseInt(pricePerDay.value, 10);
  console.log(`Days: ${days}`);
  console.log(`Price per day: ${pricePerDay.value}`);
  console.log(`Price: ${price}`);
  return price;
};

const updatePrice = (priceElement, price) => {
  // priceElement = element to update value
  // price = cents to display in dollars
  if (!Number.isNaN(price)) {
    priceElement.innerText = (price / 100).toFixed(2) ;
  }

};


startDateInput.addEventListener('change', (e) => {
  const price = calculatePrice(startDateInput, endDateInput, pricePerDay);
  updatePrice(totalPrice, price);
});

endDateInput.addEventListener('change', (e) => {
  const price = calculatePrice(startDateInput, endDateInput, pricePerDay);
  updatePrice(totalPrice, price);
});
