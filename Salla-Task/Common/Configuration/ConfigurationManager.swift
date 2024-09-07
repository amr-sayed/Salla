//
//  ConfigurationManager.swift
//  Salla-Task
//
//  Created by Amr Ahmed on 07/09/2024.
//

import SwiftUI

class ConfigurationManager {

   static let shared: ConfigurationManager = ConfigurationManager()
    private var configuration: Configuration = Configuration()
    
   private init () {
       configuration = loadConfiguration() ?? Configuration()
   }
    
    
    private func loadConfiguration() -> Configuration? {
        // Get the path to the resource
        if let url = Bundle.main.url(forResource: "Developers", withExtension: "json") {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: url)
                // Decode the JSON into the AppConfig struct
                let config = try JSONDecoder().decode(Configuration.self, from: data)
                return config
            } catch {
                print("Error reading configuration file: \(error)")
            }
        }
        return nil
    }
    
    func loadFontFamily() -> String {
        
        return configuration.fontFamily
    }
    
    func loadAppColor() -> Color {
        return configuration.appColor.IntToHex()
    }
}

private extension UInt {
    
    func IntToHex() -> Color {
        let red = Double((self >> 16) & 0xFF) / 255.0
        let green = Double((self >> 8) & 0xFF) / 255.0
        let blue = Double(self & 0xFF) / 255.0
        return Color(red: red, green: green, blue: blue)
    }
    
}


