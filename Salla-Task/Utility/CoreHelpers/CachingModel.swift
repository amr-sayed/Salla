//
//  CachingModel.swift
//  Lemonada
//
//  Created by Amr Elsayed on 31/07/2023.
//

import Foundation

class CachingModel{
    
    public struct CachingKeys  {
        static var  USER_DATA = "UserData"
        
    }
    
    
    static func getCachedData<T : Codable>(CACHE_KEY : String) -> (T)?
    {
        if let value = UserDefaults.standard.value(forKey: CACHE_KEY) as? Data{
            if let data = try? JSONDecoder().decode(T.self , from: value){
                return data
            }
        }
        return nil
    }
    
    static func setCached<T : Codable>(item : T , key : String){
        if let value = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(value, forKey: key)
        } else {
            UserDefaults.standard.set(nil, forKey: key)
        }
    }
    
    static func removeCached( key : String){
        UserDefaults.standard.set(nil, forKey: key)
    }
}
