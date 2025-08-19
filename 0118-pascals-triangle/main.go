package main

import ("fmt")

func generate(numRows int) [][]int {
  var result [][]int
	for i:= 0; i < numRows; i++ {
    var newRow []int
		for j := 0; j <= i; j++ {
			if j == 0 || j == i {
				newRow = append(newRow, 1) // push
				} else {
				prevRow := result[i - 1]
				newVal := prevRow[j - 1] + prevRow[j]
				newRow = append(newRow, newVal) // push
			}
		}
		result = append(result, newRow) // push
	}
	return result
}

func main () {
  fmt.Println(generate(6))
}