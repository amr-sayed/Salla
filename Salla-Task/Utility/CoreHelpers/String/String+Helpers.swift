//
//  String+Helpers.swift
//  OneBank
//
//  Created by Karim Azmi on 05/07/2021.
//
import UIKit
import SwiftUI

// MARK: - extension to provide default value to optional string
public extension Optional where Wrapped == String {
    var value: String {
        return self ?? ""
    }
}

public extension String {
    // MARK: - Variables
    var optional: String? {
        return self.isEmpty ? nil : self
    }
    
    var localizedKey: LocalizedStringKey {
        LocalizedStringKey(self)
    }
    
    var localized: String {
        // swiftlint:disable nslocalizedstring_key
        NSLocalizedString(
            self,
            tableName: nil,
            value: self,
            comment: ""
        )
    }
    
    var toInt: Int? {
        return Int(self)
    }
    
    var toDouble: Double? {
        return Double(self)
    }
    
    static var empty: String {
        return ""
    }
    
    static var space: String {
        return " "
    }
    
    var text: Text {
        return Text(self.localizedKey)
    }
    
    var binding: Binding<String> {
        .constant(self)
    }
    
    /// Boolean to identify whether String has content or not
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    /// String with first lettet capitalized
    var capitalize: String {
        return self.prefix(1).capitalized + dropFirst()
    }
    
    var first: String? {
        guard self.isNotEmpty else { return nil }
        return String(self[startIndex])
    }
    
    /// String with first lettet capitalized
    //    var initials: String {
    //        let words: [String]? = self.split { $0 == " " }.map(String.init)
    //        guard let words = words, words.isNotEmpty else { return "" }
    //
    //        if words.count > 1 { return String(words[0].prefix(1) + words[1].prefix(1)).uppercased() }
    //        return String(words.first?.prefix(2) ?? "").uppercased()
    //    }
    
    /// Variable that returns generated HTML from String.
    /// - Returns: Returns generated HTML from String.
    var  html: NSAttributedString? {
        do {
            guard let data = data(using: String.Encoding.utf8) else { return nil }
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    
    var decodedJson: [String: Any]? {
        if let dataFromBase64String = Data(base64Encoded: self) {
            do {
                return try JSONSerialization.jsonObject(with: dataFromBase64String, options: []) as? [String: Any]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    // MARK: - Functions
    
    /// Method to return formatted String
    /// ```
    /// String(format:"%d , %f, %ld, %@", INT_VALUE, FLOAT_VALUE, LONG_VALUE, STRING_VALUE)
    /// ```
    /// - Parameter argument: CVarArg
    /// - Returns: Formatted String
    func localizedFormat(using argument: CVarArg) -> String {
        String(format: self.localized, argument)
    }
    
    /// Method to return formatted String
    /// ```
    /// String(format:"%d , %f, %ld, %@", INT_VALUE, FLOAT_VALUE, LONG_VALUE, STRING_VALUE)
    /// ```
    /// - Parameter argument: Array of CVarArg
    /// - Returns: Formatted String
    func localizedFormat(using arguments: [CVarArg]) -> String {
        String(format: self.localized, arguments: arguments)
    }
    
    /// Method to replace string's sequence with Strings
    /// - Returns: String after replacing sequence
    func replace(_ sequence: String = "##", with: Any) -> String {
        return self.replacingOccurrences(of: sequence, with: "\(with)")
    }
    
    /// Method to decode any string to a generic decodable object
    /// - Parameter decodable: Type of decodable object
    /// - Returns: Converted String to Decodable object
    func decode<D: Decodable>(to decodable: D.Type) -> D? {
        guard let data = self.removingPercentEncoding?.data(using: .utf8),
              let decoded = try? JSONDecoder().decode(D.self, from: data) else {
            return nil
        }
        
        return decoded
    }
    
    func masked(_ length: Int = 3, reversed: Bool = false) -> String {
        let mask = String(repeating: "*", count: Swift.max(0, count - length))
        return reversed ? mask + suffix(length) : prefix(length) + mask
    }
    
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
    
    func removeWhitespace() -> String {
        return self.replace(" ", with: "")
    }
    
    //    func reverseFormattedString(using formatter: NumberFormatter) -> String {
    //        toDouble(using: formatter).toString
    //    }
    
    //    func toDouble(using formatter: NumberFormatter) -> Double {
    //        (formatter.number(from: self)?.doubleValue).value
    //    }
    //
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}

// MARK: - extension to save string to UIPastboard
public extension String {
    func copyToClipboard() {
        UIPasteboard.general.string = self
    }
}

extension String {
    func getStringIndex(index: Int) -> String.Index {
        return String.Index(utf16Offset: index, in: self)
    }
}

extension String {
    func formateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = Locale.init(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "UTC") // Need to define TimeZone
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd"
        let dayNumber = dateFormatter.string(from: date ?? Date())
        dateFormatter.dateFormat = "LLLL"
        let monthName = dateFormatter.string(from: date ?? Date())
        dateFormatter.dateFormat = "YYYY"
        let year = dateFormatter.string(from: date ?? Date())
        return dayNumber + " " + monthName + " " + year
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
}
