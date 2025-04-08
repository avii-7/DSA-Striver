let separator = " ➡️ "

func execute<T, R: Equatable>(inputs: [T], expectedOutputs: [R], for problem: (T) -> R) {
    for i in inputs.indices {
        let output = problem(inputs[i])
        print(inputs[i], output, separator: separator, terminator: " .... ")
        print(output == expectedOutputs[i] ? "✅" : "❌ .... Expected: \(expectedOutputs[i])")
    }
}


//var arr = [0, 1, 0, 3, 12]
//var arr = [0, 1, 0, 3, 12, 5, 6, 7, 0, 0, 1]
//var arr = [0, 0, 0, 1, 2, 3]
//moveZeroesOptimal(&arr)
//print(arr)

//var arr = [4, 1, 3, 9, 7]
//insertionSort(arr: &arr)
//print("INSERTION SORT: - ", arr)
//
//
//var mergeSortArr1 = [1, 2, 4, 11, 5]
//var mergeSortArr2 = [10, 8, 7, 1 ,6, 5, 8, 2]
//mergeSort(arr: &mergeSortArr2)
//print("MERGE SORT: - ", mergeSortArr2)
//
//let a = [1, 2, 3, 4, 6]
//let b = [2, 3, 5]
//let result = union(arr1: a, arr2: b)
//print(result)

 
execute(
    inputs: [
        ([1, 2, 3, 1, 1, 1, 1], 3),
        ([1, 2, 1, 3], 2),
        ([2, 2, 4, 1, 2], 2),
        ([1, 2, 3, 4, 5, 16], 15)
    ],
    expectedOutputs: [3, 1, 1, 5],
    for: longestSubarrayWithSumK3
)
