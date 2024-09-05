//
//  Double.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 05/09/2024.
//

import Foundation

extension Double {
    
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
