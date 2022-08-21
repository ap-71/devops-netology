package main

import (
	"fmt"
)



func main() {
	a := makeRange(1, 100)
	for _, value := range a {
		res := value % 3
		if res < 1 {
			fmt.Println("число", value, "делится на 3")
		}

	}
}

func makeRange(min, max int) []int {
	a := make([]int, max-min+1)
	for i := range a {
		a[i] = min + i
	}
	return a
}
