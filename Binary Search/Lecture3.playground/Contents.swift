import UIKit

var greeting = "Hello, playground"

execute(
    inputs: [
        [[0,1,1,1], [0,0,1,1], [1,1,1,1], [0,0,0,0]],
        [[0,0], [1,1]],
        [[0,0], [0,0]]
    ],
    expectedOutputs: [2, 1, -1],
    for: rowWithMax1s2
)
