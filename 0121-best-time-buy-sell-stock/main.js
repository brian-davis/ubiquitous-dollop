/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let maxSpread = 0;
  let lowI = 0;
  let highI = 0;
  do {
    let spread = prices[highI] - prices[lowI];
    if (spread < 0) {
      lowI = highI;
    } else {
      if (spread > maxSpread) {
        maxSpread = spread;
      }
      highI += 1;
    }
  } while (highI < prices.length);
  return maxSpread;
};