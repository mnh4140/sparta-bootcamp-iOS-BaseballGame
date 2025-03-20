//
//  main.swift
//  BaseballGame
//
//  Created by NH on 3/17/25.
//

import Foundation

// 랜덤 3개의 숫자 맞추는 게임
// 사용자가 입력한 3자리 수를 입력받아서 숫자 맞는지 확인하기
// 자리과 숫자가 맞다 : 스트라이크
// 숫자는 맞지만 자리는 틀리다 : 볼


let game: BaseballGame = BaseballGame(message: PrintMessage(),
                                      randomNumber: RandomNumberGenerator(),
                                      userInput: UserInput(),
game.mainMenu() // 게임 시작

