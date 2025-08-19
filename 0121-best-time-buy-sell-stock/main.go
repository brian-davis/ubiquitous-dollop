func maxProfit(prices []int) int {
  maxSpread := 0;
	lowI := 0;
	highI := 0;

	for highI < len(prices) {
		spread := prices[highI] - prices[lowI];
		if (spread < 0) {
			lowI = highI;
		} else {
			if (spread > maxSpread) {
				maxSpread = spread;
			}
			highI += 1;
		}
	}
	return maxSpread;
}