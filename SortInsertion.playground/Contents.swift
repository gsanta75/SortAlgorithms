/*
* Sort Insertion Algorithm Simulation
*
*  i = 0..<n
*  j = i - 1
*  next = A[i] (Inserted value for comparison)
*  w = winner while next < A[j] && j > 0
*
*  	|---|---|---|---|---|---|
*  [A]	| 4 | 6 | 2 | 3 | 5 | 1 |
*  	|---|---|---|---|---|---|
*  	  0   1   2   3   4   5
*
*
* i=1------>next
* j=0	|---|---|
* 		| 4 | 6 |
* 		|---|---|
*			 6<4	NO SWAP
*
*
* i=2---------->next
* j=1	|---|---|---|
* 		| 4 | 6 | 2 |
* 		|---|---|---|
*				 2<6	swap(j+1, j)
*				 w
* j=0	|---|---|---|
* 		| 4 | 2 | 6 |
* 		|---|---|---|
*			 2<4
* 			 w 			swap(j+1, j)
*		|---|---|---|
* 		| 2 | 4 | 6 |
* 		|---|---|---|
*
*
* i=3-------------->next
* j=2	|---|---|---|---|
* 		| 2 | 4 | 6 | 3 |
* 		|---|---|---|---|
*					 3<6	swap(j+1, j)
*					 w
* j=1	|---|---|---|---|
* 		| 2 | 4 | 3 | 6 |
* 		|---|---|---|---|
*				 3<4		swap(j+1, j)
*				 w
* j=0	|---|---|---|---|
* 		| 2 | 3 | 4 | 6 |
* 		|---|---|---|---|
*			 3<2			NO SWAP
*
*
* i=4------------------>next
* j=3	|---|---|---|---|---|
* 		| 2 | 3 | 4 | 6 | 5 |
* 		|---|---|---|---|---|
*						 5<6	swap(j+1, j)
*						 w
* j=2	|---|---|---|---|---|
* 		| 2 | 3 | 4 | 5 | 6 |
* 		|---|---|---|---|---|
*					 5<4		NO SWAP
*
*
* i=5---------------------->next
* j=4	|---|---|---|---|---|---|
* 		| 2 | 3 | 4 | 5 | 6 | 1 |
* 		|---|---|---|---|---|---|
*							 1<6	swap(j+1, j)
*							 w
* j=3	|---|---|---|---|---|---|
* 		| 2 | 3 | 4 | 5 | 1 | 6 |
* 		|---|---|---|---|---|---|
*						 1<5		swap(j+1, j)
*						 w
* j=2	|---|---|---|---|---|---|
* 		| 2 | 3 | 4 | 1 | 5 | 6 |
* 		|---|---|---|---|---|---|
*					 1<4			swap(j+1, j)
*					 w
* j=1	|---|---|---|---|---|---|
* 		| 2 | 3 | 1 | 4 | 5 | 6 |
* 		|---|---|---|---|---|---|
*				 1<3				swap(j+1, j)
*				 w
* j=0	|---|---|---|---|---|---|
* 		| 2 | 1 | 3 | 4 | 5 | 6 |
* 		|---|---|---|---|---|---|
*			 1<2					swap(j+1, j)
*			 w
* 		|---|---|---|---|---|---|
* 		| 1 | 2 | 3 | 4 | 5 | 6 |	[A] Sorted
* 		|---|---|---|---|---|---|
*/

import Foundation

let numbers = [4,6,2,3,5,1]

//--------------------------/
// SortInsertion Algorithms
//--------------------------/
func sortInsertion(var list:[Int])->[Int] {
    
    for i in 1..<list.count {
        var j = i - 1
        let next = list[i]
        //get off the maximum value on the right side of the array
        while j >= 0 && next < list[j] {
            (list[j + 1], list[j]) = (list[j], list[j + 1])
            j--
        }
    }
    return list
}

let sorted = sortInsertion(numbers)

// -------------------------/
// BenchMarks with O(n²)
// -------------------------/
var hundredE = [Int]()

for i in 1...100 {
    hundredE.append(Int(arc4random() % 100))
}

var thousandsE = [Int]()

for i in 1...1000 {
    thousandsE.append(Int(arc4random() % 1000))
}

var t1 = NSDate()
let s1 = sortInsertion(hundredE)
NSDate().timeIntervalSinceDate(t1)

t1 = NSDate()
let s2 = sortInsertion(thousandsE)
NSDate().timeIntervalSinceDate(t1)

