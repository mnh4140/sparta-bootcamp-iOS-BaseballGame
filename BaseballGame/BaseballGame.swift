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
    var log: LogProtocol
    
    // 초기화
    init(message: PrintMessageProtocol,
         randomNumber: RandomNumberGeneratable,
         userInput: UserInputProtocol,
         checkAnswer: CheckAnswerProtocol,
         log: LogProtocol) {
        self.message = message
        self.randomNumber = randomNumber
        self.userInput = userInput
        self.checkAnswer = checkAnswer
        self.log = log
    }

    func mainMenu() {
        var isQuit: Bool = true // 게임 반복 여부 저장 변수
        var gameCount: Int = 0 // 게임 횟수
        var logArray: [String] = []
        
        while isQuit {
            message.menu() // 메인메뉴 선택 안내 메시지 출력
            
            switch readLine() ?? "" {
            case "1":
                var tryCount = startGame() // 게임 시작 매소드 실행
                
                gameCount += 1 // 개임 횟수 증가

                logArray.append(log.gameLog(gameCount, tryCount)) // 게임 로그 저장
                
                tryCount = 0 // 시도 횟수 초기화
            case "2":
                print("< 게임 기록 보기 >")
                message.gameLog(logArray) // 로그 출력
            case "3":
                print("Bye!")
                isQuit = false // 반복문 종료
            default:
                print("올바른 번호를 입력해주세요.")
            }
        }
    }
    


    func startGame() -> Int {
        message.start() // 게임 시작 메시지 출력

        var tryCount = 0 // 시도 횟수 저장 변수
        
        let gameAnswer = randomNumber.randomNumberGenerator()

        while true {
            message.input() // 사용자 입력 메시지 출력
            
            tryCount += 1 // 시도 횟수 증가

            let userAnswer = userInput.getUserInput() // 사용자에게 숫자 입력 받기

            let gameResult = checkAnswer.check(gameAnswer, userAnswer) // 입력받은 숫자 정답 비교
            
            if gameResult.strike == 3 {
                message.success() // 정답 메시지 출력
                break // 반복문 종료
            } else if gameResult.strike == 0 && gameResult.ball == 0 {
                message.lose() // 모든 숫자를 못맞췄을 때 메시지 출력
            } else {
                // 스트라이크 볼 출력
                message.resultMessage(strike: gameResult.strike, ball: gameResult.ball)
            }
            print("") // 줄바꿈
        }
        
        return tryCount // 시도 횟수 반환
    }
}


