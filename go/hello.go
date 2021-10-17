package main

import (
  "fmt"
  "errors"
  "math"
)

type person struct {
  name string
  age int
}

func main() {
  // hello there
  fmt.Println("Hello world!")

  // assignments
  var a int = 19
  b := 10
  var tot int = a + b
  fmt.Println(tot)

  // conditionals
  if a>10 {
    fmt.Println("greater than ten")
  }else if a<10 {
    fmt.Println("less than ten")
  }else {
    fmt.Println("is ten")
  }

  // arrays
  var my_arr [5]int
  second_arr := [4]int {2,8,1,3}
  fmt.Println(my_arr)
  fmt.Println(second_arr)
  my_arr[2] = 10

  // slices
  var my_slice []int
  my_slice = append(my_slice, 3)
  new_slice := []int{1,2,4,5}
  fmt.Println(my_slice)
  fmt.Println(new_slice)

  // maps
  my_map := make(map[string]int)
  my_map["favourite"] = 3
  my_map["hate"] = 4
  fmt.Println(my_map)

  // loops
  for i := 0; i < 5; i ++ {
    fmt.Println(i)
  }

  testarr := []string{"a", "b", "c"}
  for index, value := range testarr {
    fmt.Println(index, value)
  }

  testmap := make(map[string]string)
  testmap["a"] = "allo"
  testmap["b"] = "bello"
  for key, value := range testmap {
    fmt.Println(key, value)
  }

  // functions
  new_sum := summer(2, 3)
  fmt.Println(new_sum)
  value, err := sqrt(64)
  if err != nil {
    fmt.Println(err)
  } else {
    fmt.Println(value)
  }

  // structs
  p1 := person{name:"ram", age:21}
  fmt.Println(p1.age)

  // pointers
  increm := 7
  // here the value gets increased bruh
  fmt.Println(increm)
  inc(&increm)
  fmt.Println(increm)

}

func inc(x *int) {
  // so this function gets the pointer reference and increments its actual value without returning anything
  *x++
}

func summer( x int, y int ) int {
  return x + y
}

func sqrt(x float64) (float64, error) {
  if x < 0 {
    return 0, errors.New("undefined for negatives")
  } else {
    return math.Sqrt(x), nil
  }
}
