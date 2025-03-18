//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//

class BaseballGame {
    var message: PrintMessageProtocol
    var randomNumber: RandomNumberGeneratable
    var userInput: UserInputProtocol
    var checkAnswer: CheckAnswerProtocol
    
    init(message: PrintMessageProtocol,
         randomNumber: RandomNumberGeneratable,
         userInput: UserInputProtocol,
         checkAnswer: CheckAnswerProtocol) {
        self.message = message
        self.randomNumber = randomNumber
        self.userInput = userInput
        self.checkAnswer = checkAnswer
    }
    
//    init() {
//        self.message = PrintMessage()
//        self.randomNumber = RandomNumberGenerator()
//        self.userInput = UserInput()
//        self.checkAnswer = CheckAnswer()
//    }

    func startGame() {
        message.start() // 게임 시작 메시지 출력
        
        let gameAnswer = randomNumber.randomNumberGenerator()

        while true {
            message.input() // 사용자 입력 메시지 출력

            let userAnswer = userInput.getUserInput()

            let gameResult = checkAnswer.check(gameAnswer, userAnswer)
            
            if gameResult.strike == 3 {
                message.success()
                break
            } else if gameResult.strike == 0 && gameResult.ball == 0 {
                message.lose()
            } else {
                //print("\(strike)스트라이크 \(ball)볼")
                message.resultMessage(strike: gameResult.strike, ball: gameResult.ball)
            }
            print("") // 줄바꿈
        }
    }
}


