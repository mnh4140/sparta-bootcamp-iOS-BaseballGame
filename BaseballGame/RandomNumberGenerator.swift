//
//  RandomNumberGenerator.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//
protocol RandomNumberGeneratable {
    func randomNumberGenerator() -> [Int]
}
//
struct RandomNumberGenerator: RandomNumberGeneratable {
    /**
     중복되지 않는 서로 다른 숫자 랜덤 생성 함수

     - Returns: 중복되지 않는 랜덤으로 생성한 3개의 숫자를 배열로 반환
    */
    func randomNumberGenerator() -> [Int] {
        let randomNumber1 = Int.random(in: 1...9)
        var randomNumber2: Int
        var randomNumber3: Int
 
        // 첫번째 수와 동일하지 않을 때 까지 랜덤 숫자 생성
        repeat {
            randomNumber2 = Int.random(in: 0...9)
        } while randomNumber2 == randomNumber1
        
        // 두번째 수와 세번째 수와 중복되지 않을 때 까지 랜덤 숫자 생성
        repeat {
            randomNumber3 = Int.random(in: 0...9)
        } while randomNumber3 == randomNumber1 || randomNumber3 == randomNumber2
        
        // 디버깅
        //let test = [randomNumber1, randomNumber2, randomNumber3]
        //print(test)
        
        return [randomNumber1, randomNumber2, randomNumber3]
    }
}
