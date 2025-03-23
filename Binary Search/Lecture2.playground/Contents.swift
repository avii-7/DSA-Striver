func execute<T, R>(testCases: [T], solver: (T) -> R) {
    let arrow = " ---> "
    for testCase in testCases {
        print(testCase, solver(testCase), separator: arrow)
    }
}


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

execute(testCases: testCases3, solver: minEatingSpeed2)
