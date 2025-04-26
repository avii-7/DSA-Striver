
let testCases1 = [
    36, 5, 30, 1, 0, 10
]

//execute(testCases: testCases1, solver: sqrtN2)

let testCases2 = [
    (3, 27), (4, 69), (3, 64), (1, 14), (3, 9), (8, 256)
]

//execute(testCases: testCases2, solver: NthRoot2)

let testCases3 = [
    ([3,6,7,11], 8),
    ([30,11,23,4,20], 5),
    ([30,11,23,4,20], 6),
    ([5], 4)
]

//execute(testCases: testCases3, solver: minEatingSpeed2)

// ------------------------------------------------------------------------------

// 4 Min Days for Bouquets

//execute(
//    inputs: [
//        ([1,10,3,10,2], 3, 1),
//        ([1,10,3,10,2], 3, 2),
//        ([7,7,7,7,12,7,7], 2, 3),
//        ([30, 49, 11, 66, 54, 22, 2, 57, 35], 3, 3),
//        ([62,75,98,63,47,65,51,87,22,27,73,92,76,44,13,90,100,85], 2, 7)
//    ],
//    expectedOutputs: [3, -1, 12, 66, 98],
//    for: minDays1
//)

// MARK: - 1283. Find the Smallest Divisor Given a Threshold

//execute(
//    inputs: [
//        ([1,2,5,9], 6),
//        ([44,22,33,11,1], 5),
//        ([200,100,14], 10)
//    ],
//    expectedOutputs: [5, 44, 34],
//    for: smallestDivisor2)

//execute(
//    inputs: [
//        ([1,2,3,4,5,6,7,8,9,10], 5),
//        ([3,2,2,4,1,4], 3),
//        ([1,2,3,1,1], 4)
//    ],
//    expectedOutputs: [15, 6, 3],
//    for: shipWithinDays1)

// MARK: - 1539. Kth Missing Positive Number

//execute(
//    inputs: [
//        ([2,3,4,7,11], 5),
//        ([1,2,3,4], 2),
//        ([1, 2, 4, 9, 12], 3),
//        ([5,6,7,8,9], 9)
//    ],
//    expectedOutputs: [9, 6, 6, 14],
//    for: findKthPositiveOptimal)

// MARK: - Aggressive Cows

//execute(
//    inputs: [
//        ([1, 2, 3], 2),
//        ([0, 3, 4, 7, 10, 9], 4),
//        ([4, 2, 1, 3, 6], 2),
//        ([0, 3, 4, 7, 10], 3)
//    ],
//    expectedOutputs: [2, 3, 5, 4],
//    for: aggressiveCows1)

// MARK: - Allocate Books

//execute(
//    inputs: [
//        ([12, 34, 67, 90], 4, 2),
//        ([25, 46, 28, 49, 24], 5, 4),
//        ([10, 20, 30, 40, 500], 5, 4)
//    ],
//    expectedOutputs: [113, 71, 500], for: findPages)

// MARK: - Split Array Largest Sum

//execute(
//    inputs: [
//        ([7,2,5,10,8], 2),
//        ([1,2,3,4,5], 2),
//        ([2,3,1,1,1,1,1], 5)
//    ],
//    expectedOutputs: [18, 9, 3], for: splitArray1)


// MARK: - Minimize Max Distance to Gas Station

//execute(
//    inputs: [
//        ([1,2,3,4], 3),
//        ([1, 7], 2)
//    ],
//    expectedOutputs: [0.5, 2], for: minimiseMaxDistance2)

// MARK: - Median of Two Sorted Array

//execute(
//    inputs: [
//        ([2, 4, 6], [1, 3, 5]),
//        ([2, 4, 6], [1, 3])
//    ],
//    expectedOutputs: [3.5, 3], for: findMedianSortedArrays3)

// MARK: - K-th element of Two Sorted Array

//execute(
//    inputs: [
//        ([2, 3, 45], [4, 6, 7, 8], 4),
//        ([2, 3, 6, 7, 9], [1, 4, 8, 10], 4),
//        ([1, 2, 3, 5, 6], [4, 7, 8, 9, 100], 6)
//    ],
//    expectedOutputs: [6, 4, 6], for: kthElement2)

let arr1 = [1, 2, 3, 5, 6]
let arr2 = [4, 7, 8, 9, 100]
let inputs = Array(1...(arr1.count + arr2.count)).map { i in
    ([1, 2, 3, 5, 6], [4, 7, 8, 9, 100], i)
}

var mergedArray = arr1 + arr2
mergedArray.sort()

let outputs = mergedArray

execute(
    inputs: inputs,
    expectedOutputs: outputs, for: kthElement2)

execute(
    inputs: [([76, 94, 100], [5, 5, 9, 11, 31, 36, 68, 71, 75, 100], 12)],
    expectedOutputs: [100], for: kthElement2)


let abc = [76, 94, 100] + [5, 5, 9, 11, 31, 36, 68, 71, 75, 100]
