//
//  CountStrikesAndBalls.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//
protocol CheckAnswerProtocol {
    func check(_ userInput: [Int], _ randomNumber: [Int]) -> (strike: Int, ball: Int)
}

struct CheckAnswer: CheckAnswerProtocol {
    func check(_ userInput: [Int], _ randomNumber: [Int]) -> (strike: Int, ball: Int) {
        var strikeCount = 0
        var ballCount = 0
        
        for i in 0..<userInput.count {
            if randomNumber[i] == userInput[i] {
                strikeCount += 1
            } else {
                if randomNumber.contains(userInput[i]) {
                    ballCount += 1
                }
            }
        }
        
        return (strikeCount, ballCount)
    }
}
