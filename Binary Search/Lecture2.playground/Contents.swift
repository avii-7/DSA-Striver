
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

execute(
    inputs: [
        ([1,2,3,4,5,6,7,8,9,10], 5),
        ([3,2,2,4,1,4], 3),
        ([1,2,3,1,1], 4)
    ],
    expectedOutputs: [15, 6, 3],
    for: shipWithinDays1)
