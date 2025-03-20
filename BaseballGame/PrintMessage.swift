//
//  PrintMessage.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//
protocol PrintMessageProtocol {
    func menu()
    func start()
    func input()
    func success()
    func lose()
    func resultMessage(strike: Int, ball: Int)
    func gameLog(_ gameLog: [String])
}

/**
 출력 기능 담당하는 구조체
 */
struct PrintMessage: PrintMessageProtocol {
    // 메뉴 선택 메시지 출력
    func menu() {
        print("환영합니다! 원하시는 번호를 입력해주세요\n")
        print("1. 게임 시작하기 2. 게임 기록 보기 3. 종료하기")
    }
    
    // 게임 시작 메시지 출력
    func start(){
        print("< 게임을 시작합니다. >")
    }

    // 사용자에게 세자리 숫자 입력 요구 메시지 출력
    func input() {
        print("세 자리 숫자를 입력하세요.")
    }
    
    // 게임 정답을 맞추면 나오는 메시지 출력
    func success() {
        print("정답입니다!\n")
    }
    
    // 모든 숫자가 틀렸을 경우 메시지 출력
    func lose() {
        print("Nothing")
    }
    
    // 스트라이크와 볼 메시지 출력
    func resultMessage(strike: Int, ball: Int) {
        print("\(strike)스트라이크 \(ball)볼")
    }
    
    // 2번 메뉴 선택 시 메시지 출력
    func gameLog(_ gameLog: [String]) {
        for log in gameLog {
            print(log)
        }
        print("")
    }
}
