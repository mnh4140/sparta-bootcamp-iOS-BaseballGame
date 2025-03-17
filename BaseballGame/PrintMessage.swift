//
//  PrintMessage.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//

// 출력 기능
protocol PrintMessageProtocol {
    func start()
    func input()
    func success()
    func lose()
    func resultMessage(strike: Int, ball: Int)
}

struct PrintMessage: PrintMessageProtocol {
    func start(){
        print("< 게임을 시작합니다. >")
    }
    
    func input() {
        print("세 자리 숫자를 입력하세요.")
    }

    func success() {
        print("정답입니다!\n")
    }

    func lose() {
        print("Nothing")
    }
    func resultMessage(strike: Int, ball: Int) {
        print("\(strike)스트라이크 \(ball)볼")
    }
}
