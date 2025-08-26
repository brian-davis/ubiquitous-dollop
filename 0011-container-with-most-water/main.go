package main
import ("fmt")

// beats 5%
func maxIntSlice(intSlice []int) int {
	if len(intSlice) > 0 {
		_max := intSlice[0]
		for _, e := range(intSlice) {
			if e > _max {
				_max = e
			}
		}
		return _max
	}
	return -1
}

func minIntSlice(intSlice []int) int {
	if len(intSlice) > 0 {
		_min := intSlice[0]
		for _, e := range(intSlice) {
			if e < _min {
				_min = e
			}
		}
		return _min
	}
	return -1
}

func maxArea(heights []int) int {
	fmt.Println(heights)
	heightIndexes := map[int][]int{}
	for i, e := range(heights) {
		_, ok := heightIndexes[e]
		if ok {
			heightIndexes[e] = append(heightIndexes[e], i)
		} else {
			heightIndexes[e] = []int{i}
		}
	}
	fmt.Println(heightIndexes)
	maxHeight := maxIntSlice(heights)
	fmt.Println("maxHeight: ", maxHeight)
	maxVol := 0
	fmt.Println(maxVol)
	leftBound := -1 // nil
	fmt.Println(leftBound)
	rightBound := -1 // nil
	fmt.Println(rightBound)

	for height := maxHeight; height >= 0; height-- {
		fmt.Println("height: ", height)
		heightVal, ok := heightIndexes[height]
		fmt.Println("heightVal: ", heightVal)
		if ok {
			levelLeftBound := minIntSlice(heightVal)
			fmt.Println("levelLeftBound: ", levelLeftBound)
			levelRightBound := maxIntSlice(heightVal)
			fmt.Println("levelRightBound: ", levelRightBound)
			if leftBound == -1 {
				leftBound = levelLeftBound
			}
			if rightBound == -1 {
				rightBound = levelRightBound
			}
			rightBound = max(levelRightBound, rightBound)
			leftBound = min(levelLeftBound, leftBound)
			fmt.Println("leftBound: ", leftBound)
			fmt.Println("rightBound: ", rightBound)
			width := rightBound - leftBound
			fmt.Println("width: ", width)
			vol := width * height
			fmt.Println("vol: ", vol)
			maxVol = max(maxVol, vol)
			fmt.Println("maxVol: ", maxVol)
		}
	}
	fmt.Println("maxVol: ", maxVol)
	return maxVol
}

func main() {
	// a := []int{2,1}
	// r := maxArea(a)
	// e := 1
	// fmt.Println("r: ", r)
	// fmt.Println(r == e)

	a := []int{1,8,6,2,5,4,8,3,7}
	r := maxArea(a)
	e := 49
	fmt.Println(r)
	fmt.Println(r == e)
}

// 🤖 0011-container-with-most-water $ go run main.go
// [1 8 6 2 5 4 8 3 7]
// map[1:[0] 2:[3] 3:[7] 4:[5] 5:[4] 6:[2] 7:[8] 8:[1 6]]
// maxHeight:  8
// 0
// -1
// -1
// height:  8
// heightVal:  [1 6]
// levelLeftBound:  0
// levelRightBound:  6
// leftBound:  0
// rightBound:  6
// width:  6
// vol:  48
// maxVol:  48
// height:  7
// heightVal:  [8]
// levelLeftBound:  0
// levelRightBound:  8
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  56
// maxVol:  56
// height:  6
// heightVal:  [2]
// levelLeftBound:  0
// levelRightBound:  2
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  48
// maxVol:  56
// height:  5
// heightVal:  [4]
// levelLeftBound:  0
// levelRightBound:  4
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  40
// maxVol:  56
// height:  4
// heightVal:  [5]
// levelLeftBound:  0
// levelRightBound:  5
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  32
// maxVol:  56
// height:  3
// heightVal:  [7]
// levelLeftBound:  0
// levelRightBound:  7
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  24
// maxVol:  56
// height:  2
// heightVal:  [3]
// levelLeftBound:  0
// levelRightBound:  3
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  16
// maxVol:  56
// height:  1
// heightVal:  [0]
// levelLeftBound:  0
// levelRightBound:  0
// leftBound:  0
// rightBound:  8
// width:  8
// vol:  8
// maxVol:  56
// height:  0
// heightVal:  []
// maxVol:  56
// 56
// false