func maxProfit(prices []int) int {
  profit := 0;
	for i := 1; i < len(prices); i++ {
		left := prices[i - 1];
		current := prices[i];
		if current > left {
			profit += current - left;
		}
	}
	return profit;
}