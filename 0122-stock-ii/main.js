/**
 * @param {number[]} prices
 * @return {number}
 */

// var maxProfit = function(prices) {
//   let gains = 0;
//   let buyPrice = 0;
//   let sellPrice = 0;

//   for (let i = 0; i < prices.length; i++) {
//     // console.log("i: ", i);
//     let yesterday = prices[i - 1];
//     let today = prices[i];
//     let tomorrow = prices[i + 1];
//     // console.log(`yesterday: ${yesterday}; today: ${today}; tomorrow: ${tomorrow};`);

//     let spread = today - yesterday; // undefined OK
//     let lookaheadSpread = tomorrow ? (today - tomorrow) : 1 // final day sell

//     // console.log("spread: ", spread);
//     // console.log("lookaheadSpread: ", lookaheadSpread);

//     if (!spread || spread <= 0) {
//       buyPrice = today;
//       // console.log("new low; buyPrice ", buyPrice);
//     } else {
//       sellPrice = today;
//       if (lookaheadSpread >= 0) {
//         let sale = sellPrice - buyPrice;
//         gains += sale;
//         sellPrice = buyPrice = 0;
//         // console.log(`sell high; sale: ${sale}; gains: ${gains}`);
//       }
//     }
//     // console.log("-----");
//   }
//   return gains;
// };

var maxProfit = function(prices) {
  let profit = 0;
  for (let i = 0; i < prices.length; i++) {
    let left = prices[i - 1];
    let current = prices[i];
    if (current > left) {
      profit += (current - left);
    }
  }
  return profit;
}

let prices = [2,1,2,0,1];
//                1   1
let r = maxProfit(prices);
console.log(r);
console.log(r == 2);