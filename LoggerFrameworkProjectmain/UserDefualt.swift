//
//  UserDefualt.swift
//  LoggerFrameworkProjectmain
//
//  Created by Noye Samuel on 22/12/2022.
//

import Foundation

class UserDefault {
    static let shared = UserDefault()
    
    private init() {}
    
    func setValue(value: Any, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    func value(forKey key: String) -> Any? {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: key)
    }
}
