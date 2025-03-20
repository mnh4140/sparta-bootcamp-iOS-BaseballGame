//
//  UserInput.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//
protocol UserInputProtocol {
    func getUserInput() -> [Int]
}

// 사용자에게 정답을 입력 받는 기능
struct UserInput: UserInputProtocol {
    
    func getUserInput() -> [Int] {
        
        // 사용자에게 숫자 입력받기
        let userInputString = readLine() ?? ""
        

        // 예외처리 1. 숫자 외 문자 입력 시, 에러 출력
        guard Int(userInputString) != nil else {
            print("Error!! 숫자를 입력하세요.\n")
            return getUserInput()
        }
        
        // 예외처리 2. 세자리 숫자를 입력하지 않을 시, 에러 출력
        guard userInputString.count == 3 else {
            print("Error!! 세 자리 숫자가 아닙니다.")
            return getUserInput()
        }
        
        // 사용자에게 입력받은 숫자를 넣을 배열 선언
        var userInputArray: [Int] = []
        
        // 배열에 사용자가 입력한 숫자 저장
        for character in userInputString {
            if let number = Int(String(character)) {
                userInputArray.append(number)
            }
        }
        
        // 결과 반환
        return userInputArray
    }
}
