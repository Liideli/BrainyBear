//
//  UserData.swift
//  BrainyBear
//
//  Created by iosdev on 5.4.2023.
//

import Foundation
import SwiftUI

struct User {
    @AppStorage("COINS_KEY") var savedCoins = 0
    
    init(savedCoins: Int = 0) {
        self.savedCoins = savedCoins
    }
    
    func modifyCoins() {
        self.savedCoins += 50
        print("\(self.savedCoins)")
    }
    
    func getCoins () -> Int {
        return self.savedCoins
    }
}
