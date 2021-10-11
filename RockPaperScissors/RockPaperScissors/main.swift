//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printGameNotice() {
    print("가위(1), 바위(2), 보(3)!<종료 : 0>", terminator: " : ")
}

func determineComputersHand() -> Int {
    let computersHand = Int.random(in: 1...3)
    
    return computersHand
}

func receiveUsersHand() -> Int? {
    guard let usersHand = readLine() else {
        return nil
    }
        
    return Int(usersHand)
}
