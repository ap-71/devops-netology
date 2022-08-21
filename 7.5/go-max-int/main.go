package main

import (
	"fmt"
	"sort"
)



func main() {
	// arr := []int{3, 15, 2, 9}
	x := []int{48, 96, 86, 68, 57, 82, 63, 70, 37, 34, 83, 27, 19, 97, 9, 17}
	// Отсортировать и взять последний элемент
	sort.Ints(x)
	fmt.Println("максимальный элемент методом сортировки: ", x[len(x)-1])

	// Или через цикл
	max := x[0]
	for _, element := range x {
		if element > max {
			max = element
		}
	}

	fmt.Println("максимальный элемент через цикл: ", max)

	min := x[0]
	for _, element := range x {
		if element < min {
			min = element
		}
	}

	fmt.Println("минимальный элемент через цикл: ", min)
}
