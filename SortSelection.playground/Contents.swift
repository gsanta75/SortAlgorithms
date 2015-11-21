/*
 * Sort Selection Algorithm Simulation
 *
 *
 *       |---|---|---|---|---|---|
 *  [A]  | 4 | 6 | 2 | 3 | 5 | 1 |
 *       |---|---|---|---|---|---|
 *         0   1   2   3   4   5
 *
 *  i = 0..<n-1 (set n-1 because if n = 5 j = 6 -> OUT BOUNDS)
 *  j = i + 1..<n
 *  w = winner if A[j] < A[i]
 *
 *  i=0  |---|---|---|---|---|---|
 *       | 4 | 6 | 2 | 3 | 5 | 1 |
 *       |---|---|---|---|---|---|
 *
 *  j=1      |---|---|---|---|---|
 *           | 6 | 2 | 3 | 5 | 1 |
 *           |---|---|---|---|---|
 *            6<4 2<4 3<2 5<2 1<2
 *                w1          w2    swap(4, w2)
 *
 *  i=1  |---|---|---|---|---|---|
 *       | 1 | 6 | 2 | 3 | 5 | 4 |
 *       |---|---|---|---|---|---|
 *
 *  j=2          |---|---|---|---|
 *               | 2 | 3 | 5 | 4 |
 *               |---|---|---|---|
 *                2<6 3<2 5<2 4<2
 *                w1                swap(6, w1)
 *
 *  i=2  |---|---|---|---|---|---|
 *       | 1 | 2 | 6 | 3 | 5 | 4 |
 *       |---|---|---|---|---|---|
 *
 *  j=3              |---|---|---|
 *                   | 3 | 5 | 4 |
 *                   |---|---|---|
 *                    3<6 5<3 4<3
 *                    w1            swap(6, w1)
 *
 *  i=3  |---|---|---|---|---|---|
 *       | 1 | 2 | 3 | 6 | 5 | 4 |
 *       |---|---|---|---|---|---|
 *
 *  j=4                  |---|---|
 *                       | 5 | 4 |
 *                       |---|---|
 *                        5<6 4<5
 *                        w1  w2    swap(6, w2)
 *
 *  i=4  |---|---|---|---|---|---|
 *       | 1 | 2 | 3 | 4 | 5 | 6 |
 *       |---|---|---|---|---|---|
 *
 *  j=5                      |---|
 *                           | 6 |
 *                           |---|
 *                            6<5   no swap
 *
 *       |---|---|---|---|---|---|
 *  [A]  | 1 | 2 | 3 | 4 | 5 | 6 |  Sorted
 *       |---|---|---|---|---|---|
 */

import Foundation


let numbers = [4,6,2,3,5,1]

// -------------------------/
// SortSelection Algorithms
// -------------------------/

func sortSelection<T: Comparable>(var elements: [T]) -> [T] {
    
    for i in 0..<elements.count - 1 {
        var indexMin = i
        for j in i+1..<elements.count {
            if elements[j] < elements[indexMin] {
                indexMin = j
            }
        }
        if indexMin != i {
            (elements[indexMin], elements[i]) = (elements[i], elements[indexMin])
        }
    }
    return elements
}

let sorted = sortSelection(numbers)

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
let s1 = sortSelection(hundredE)
NSDate().timeIntervalSinceDate(t1)

t1 = NSDate()
let s2 = sortSelection(thousandsE)
NSDate().timeIntervalSinceDate(t1)
