import Foundation

execute(
    inputs: [
        "(()())(())",
        "(()())(())(()(()))",
        "()()"
    ],
    expectedOutputs: ["()()()", "()()()()(())", ""],
    for: removeOuterParentheses2
)
