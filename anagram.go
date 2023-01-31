package main

import (
	"fmt"
	"sort"
)

func main(){
	for _, g := range groupAnagrams([]string{"cook", "save", "taste", "aves", "vase", "state", "map"} ) {
		fmt.Println(g)
}
}

func groupAnagrams(strs []string) [][]string {
	a := make(map[string][]string)
	for _, b := range strs {
		bytes := []byte(b)
		sort.SliceStable(bytes, func(i, j int) bool {
			return bytes[i] < bytes[j]
		})
		c := string(bytes)
		a[c] = append(a[c], b)
	}
	var gr [][]string
	for e := range a {
		gr = append(gr, a[e])
	}
	return gr
}