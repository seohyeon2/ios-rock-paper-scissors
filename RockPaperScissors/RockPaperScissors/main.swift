//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
enum Hand : Int, CaseIterable {
    case scissors = 1
    case rock = 2
    case paper = 3
}

enum Result: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

struct RockScissorsPaper {
    private var computerResult: Hand?
    private var userResult: Hand?
    
    private func choiceUserHand() -> Hand? {
        let userInputArray: Array<Int> = [0, 1, 2, 3]
        print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: " ")
        
        guard let userInput = Int(readLine() ?? "nil check"), userInputArray.contains(userInput) else {
            print("잘못된 입력입니다. 다시 입력해주세요")
            return choiceUserHand()
        }
        
        return Hand(rawValue: userInput)
    }
    
    private func computerHands() -> Hand {
        if let randomHand = Hand.allCases.randomElement() {
            return randomHand
        } else {
            return computerHands()
        }
    }
    
    private mutating func compare(userHand: Hand, computerHand: Hand) {
        let result = computerHand.rawValue - userHand.rawValue
        
        switch result {
        case 0:
            print(Result.draw.rawValue)
            startGame()
        case 1, -2:
            print(Result.lose.rawValue)
        case -1, 2:
            print(Result.win.rawValue)
        default:
            break
        }
    }
    
    mutating func startGame() {
        guard let userHand = choiceUserHand() else {
            print("게임 종료")
            return
        }
        
        compare(userHand: userHand, computerHand: computerHands())
    }
}

var rockScissorsPaper = RockScissorsPaper()
rockScissorsPaper.startGame()

