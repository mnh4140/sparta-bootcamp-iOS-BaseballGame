//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//

class BaseballGame {
    var printMessage: PrintMessageProtocol // 프로토콜
    var randomNumber: RandomNumberGenerator
    var userinput: UserInput
    var checkAnswer: CheckAnswer
    
    init() {
        self.printMessage = PrintMessage()
        self.randomNumber = RandomNumberGenerator()
        self.userinput = UserInput()
        self.checkAnswer = CheckAnswer()
    }

    func startGame() {
        printMessage.start() // 게임 시작 메시지 출력
        
        let gameAnswer = randomNumber.randomNumberGenerator()

        while true {
            printMessage.input() // 사용자 입력 메시지 출력

            let userAnswer = userinput.getUserInput()

            let gameResult = checkAnswer.check(gameAnswer, userAnswer)
            
            if gameResult.strike == 3 {
                printMessage.success()
                break
            } else if gameResult.strike == 0 && gameResult.ball == 0 {
                printMessage.lose()
            } else {
                //print("\(strike)스트라이크 \(ball)볼")
                printMessage.resultMessage(strike: gameResult.strike, ball: gameResult.ball)
            }
            print("") // 줄바꿈
        }
    }
}


