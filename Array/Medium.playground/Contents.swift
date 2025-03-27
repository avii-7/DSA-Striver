let separator = " ➡️ "

func execute<T, R: Equatable>(inputs: [T], expectedOutputs: [R], for problem: (T) -> R) {
    for i in inputs.indices {
        let output = problem(inputs[i])
        print(inputs[i], output, separator: separator, terminator: " .... ")
        print(output == expectedOutputs[i] ? "✅" : "❌ .... Expected: \(expectedOutputs[i])")
    }
}

execute(
    inputs: [
        [[1,2,3],[4,5,6],[7,8,9]],
        [[1,2,3,4],[5,6,7,8],[9,10,11,12]],
        [[1, 2, 3, 4, 5]],
        [[1], [2], [3], [4]]
    ],
    expectedOutputs: [
        [1,2,3,6,9,8,7,4,5],
        [1,2,3,4,8,12,11,10,9,5,6,7],
        [1, 2, 3, 4, 5],
        [1, 2, 3, 4]
    ],
    for: spiralOrder
)
