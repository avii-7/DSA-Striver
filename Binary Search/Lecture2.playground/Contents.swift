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

execute(testCases: testCases2, solver: NthRoot2)
