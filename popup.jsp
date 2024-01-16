<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Seat Selection</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin: 20px;
    }

    .screen {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .seat-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      margin-bottom: 20px;
    }

    .row {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .seat {
      width: 30px;
      height: 30px;
      margin: 5px;
      background-color: #ccc;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .seat.available:hover {
      background-color: #b3b3b3; /* Light gray on hover for available seats */
    }

    .seat.selected {
      background-color: #36c13c; /* Green for selected seats */
    }

    .seat.booked {
      background-color: #f00; /* Red for booked seats */
      cursor: not-allowed;
    }

    .aisle-sign {
      margin: 0 5px;
      font-size: 10px;
      color: #666;
    }

    .aisle {
      width: 30px;
    }

    .showcase {
      list-style: none;
      padding: 0;
      display: flex;
      justify-content: center;
      margin-bottom: 20px;
    }

    .showcase li {
      margin-right: 20px;
      display: flex;
      align-items: center;
    }

    .showcase li div {
      width: 20px;
      height: 20px;
      margin-right: 5px;
    }

    .available.showcase div {
      background-color: #ccc;
    }

    .selected.showcase div {
      background-color: #36c13c;
    }

    .booked.showcase div {
      background-color: #f00;
    }

    .container {
      margin-bottom: 20px;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .proceed-button {
      padding: 10px 20px;
      font-size: 16px;
      background-color: #4CAF50;
      color: #fff;
      border: none;
      cursor: pointer;
    }

  </style>
</head>
<body>
<h2>Seat Selection</h2>

<div class="screen">Screen This Way</div>
<div class="seat-container" id="seatContainer">
  <!-- Your seats go here -->
</div>

<ul class="showcase">
  <li>
    <div class="seat available"></div>
    <small>Available</small>
  </li>
  <li>
    <div class="seat selected"></div>
    <small>Selected</small>
  </li>
  <li>
    <div class="seat booked"></div>
    <small>Booked</small>
  </li>
</ul>

<div class="container">
  <!-- Your seat rows go here -->
</div>

<p class="text">
  You have selected <span id="count">0</span> seat(s) for a total price of $<span id="total">0</span>
</p>

<!-- Assuming you have a button to add a seat -->
<button onclick="addSeat()">Add Seat</button>

<button class="proceed-button" onclick="proceedForPaymentWrapper()">Proceed for Payment</button>

<!-- Embedding JavaScript within JSP -->
<script>
  let selectedSeats = 0;
  const pricePerSeat = 10; // Replace with your actual price per seat

  function updateSeatInfo() {
    const seatCountElement = document.getElementById('count');
    const totalPriceElement = document.getElementById('total');

    seatCountElement.textContent = selectedSeats;

    const totalPrice = selectedSeats * pricePerSeat;
    totalPriceElement.textContent = totalPrice;
  }

  function addSeat() {
    selectedSeats++;
    updateSeatInfo();
  }

  function getAvailableSeats(rows, columns) {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const seatLabels = [];
    for (let i = 0; i < rows; i++) {
      for (let j = 1; j <= columns; j++) {
        const seatLabel = letters[i] + j;
        seatLabels.push(seatLabel);
      }
    }
    return seatLabels;
  }

  function initializeSeatSelection(rows, columns) {
    const seatContainer = document.getElementById('seatContainer');
    const availableSeats = getAvailableSeats(rows, columns);
    let currentRow = 0;

    for (let i = 0; i < rows; i++) {
      const rowElement = document.createElement('div');
      rowElement.classList.add('row');

      for (let j = 0; j < columns; j++) {
        const seatElement = document.createElement('div');
        seatElement.classList.add('seat', 'available');
        seatElement.textContent = availableSeats[currentRow * columns + j];
        seatElement.addEventListener('click', () => toggleSeatSelection(seatElement));
        rowElement.appendChild(seatElement);

        if (j === Math.floor(columns / 2) - 1) {
          const aisleSign = document.createElement('div');
          aisleSign.classList.add('aisle-sign');
          aisleSign.textContent = 'Aisle';
          rowElement.appendChild(aisleSign);
        }
      }

      seatContainer.appendChild(rowElement);

      if (currentRow < rows - 1) {
        const aisleElement = document.createElement('div');
        aisleElement.classList.add('aisle');
        seatContainer.appendChild(aisleElement);
      }

      currentRow++;
    }
  }

  function toggleSeatSelection(seatElement) {
    if (seatElement.classList.contains('booked')) {
      return; // Do not toggle selection for booked seats
    }

    seatElement.classList.toggle('selected');
    seatElement.classList.toggle('available');

    updateSelectedCount();
  }

  function saveSelectedSeats() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    const seatsIndex = [...selectedSeats].map(seat => [...seats].indexOf(seat));
    localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));
  }

  function updateSelectedCount() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    const selectedSeatsCount = selectedSeats.length;

    document.getElementById('count').innerText = selectedSeatsCount;
    document.getElementById('total').innerText = selectedSeatsCount * pricePerSeat;

    saveSelectedSeats();
  }

  function populateUI() {
    const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));

    if (selectedSeats !== null && selectedSeats.length > 0) {
      seats.forEach((seat, index) => {
        if (selectedSeats.indexOf(index) > -1) {
          seat.classList.add('selected');
          seat.classList.remove('available');
        }
      });
    }
  }

  const container = document.querySelector('.container');
  const seats = document.querySelectorAll('.row .seat:not(.booked)');

  container.addEventListener('click', (e) => {
    if (e.target.classList.contains('seat') && !e.target.classList.contains('booked')) {
      toggleSeatSelection(e.target);
    }
  });

  initializeSeatSelection(10, 20);
  populateUI();

  function proceedForPaymentWrapper() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    const totalPrice = selectedSeats.length * pricePerSeat;
    proceedForPayment(totalPrice);
  }

  function proceedForPayment(totalPrice) {
    if (selectedSeats === 0) {
      alert('Please select at least one seat before proceeding to payment.');
    } else {
      // Simulated payment logic (replace with your actual payment integration code)
      alert(`Proceeding for payment. Total amount: {totalPrice}`);
      // Redirect to payment.jsp
      window.location.href = 'http://localhost:8080/demo1_war_exploded/payment.jsp';
    }
  }

</script>
</body>
</html>
