//
//  Log.swift
//  BaseballGame
//
//  Created by NH on 3/18/25.
//

protocol LogProtocol {
    func gameLog(_ gameCount: Int, _ tryCount: Int) -> String
}

struct Log: LogProtocol {
    func gameLog(_ gameCount: Int, _ tryCount: Int) -> String {
        return "\(gameCount)번째 게임 : 시도 횟수 - \(tryCount)"
    }
}

