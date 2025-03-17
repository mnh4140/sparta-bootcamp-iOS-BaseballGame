//
//  main.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//

import Foundation

var strikeCount = 0 // 스트라이크 카운트 저장 변수
var ballCount = 0 // 볼 카운드 저장 변수
var isSuccess: Bool = false // 게임 승리 여부 저장 변수

// 랜덤 3개의 숫자 맞추는 게임
// 사용자가 입력한 3자리 수를 입력받아서 숫자 맞는지 확인하기
// 자리과 숫자가 맞다 : 스트라이크
// 숫자는 맞지만 자리는 틀리다 : 볼


/**
 중복되지 않는 서로 다른 숫자 랜덤 생성 함수

 - Returns: 중복되지 않는 랜덤으로 생성한 3개의 숫자를 배열로 반환
*/
func RandomNumberGenerator() -> [Int] {
    let randomNumber1 = Int.random(in: 1...9)
    var randomNumber2: Int
    var randomNumber3: Int
    
    // 첫번째 수와 동일하지 않을 때 까지 랜덤 숫자 생성
    repeat {
        randomNumber2 = Int.random(in: 1...9)
    } while randomNumber2 == randomNumber1
    
    // 두번째 수와 세번째 수와 중복되지 않을 때 까지 랜덤 숫자 생성
    repeat {
        randomNumber3 = Int.random(in: 1...9)
    } while randomNumber3 == randomNumber1 || randomNumber3 == randomNumber2
    
    return [randomNumber1, randomNumber2, randomNumber3]
}

/**
 사용자에게 숫자 입력 받는 함수
 - Returns: 사용자가 입력한 숫자를 배열로 반환 합니다.

*/

func getUserInput() -> [Int] {
    print("세 자리 숫자를 입력하시요.\n")
    
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

/**
 입력받은 숫자가 랜덤 숫자와 동일한지 확인하는 함수
 
 - Parameters:
    - userInput: 사용자에게 입력받은 숫자
    - randomNumber: 랜덤으로 생성한 숫자
 - Returns: 게임 승리 여부를 Bool 타입으로 반환
 */
func checkAnswer(_ userInput: [Int], _ randomNumber: [Int]) -> Bool {
    for i in 0..<userInput.count {
        if randomNumber[i] == userInput[i] {
            strikeCount += 1
        } else {
            if randomNumber.contains(userInput[i]) {
                ballCount += 1
            }
        }
    }
    
    if strikeCount == 3 {
        print("\n정답입니다!!")
        
        return true
    } else if strikeCount == 0 && ballCount == 0 {
        print("strike :\t\(strikeCount)")
        print("ball : \t\(ballCount)")
        print("OUT!\n")
        
        strikeCount = 0
        ballCount = 0
        
        return false
        
    } else {
        print("strike :\t\(strikeCount)")
        print("ball :\t\(ballCount)\n")
        
        strikeCount = 0
        ballCount = 0
        
        return false
    }
}

/**
 메인 함수
 */
func main() {
    print("< 게임을 시작합니다. >")
    let comNum = RandomNumberGenerator()
    print(comNum)


    while !isSuccess {
        let userNum = getUserInput()
        isSuccess = checkAnswer(userNum, comNum)
    }
}

main()
