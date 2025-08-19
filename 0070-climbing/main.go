package main

import ("fmt")

func climbStairs(n int) int {
  fibs := []int{1,1}
	for i:= 0; i <= n; i++ {
		if i >= len(fibs) {
			appFib := fibs[i - 1] + fibs[i - 2]
			fibs = append(fibs, appFib)
		}
	}
	return fibs[n]
}

func main () {
	for i := 1; i <= 10; i++ {
		fmt.Println(climbStairs(i))
	}
}