//
//  Extensions.swift
//  Projeto-mini-ITI
//
//  Created by William Moraes da Silva on 08/10/21.
//

import Foundation

/**
  https://stackoverflow.com/questions/26180888/what-are-best-practices-for-validating-email-addresses-in-swift
  */ 
extension String{
 func isEmail() -> Bool
 {
     let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
     return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
 }
}



/**
 Fonte: StackOverFlow 😜
 https://gist.github.com/LeonardoCardoso/3517ff69e4a45012fa6c8d9cbb506730
 */

extension String {
    var isCPF: Bool {
        let numbers = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        guard numbers.count == 11 else { return false }

        let set = NSCountedSet(array: Array(numbers))
        guard set.count != 1 else { return false }

        let i1 = numbers.index(numbers.startIndex, offsetBy: 9)
        let i2 = numbers.index(numbers.startIndex, offsetBy: 10)
        let i3 = numbers.index(numbers.startIndex, offsetBy: 11)
        let d1 = Int(numbers[i1..<i2])
        let d2 = Int(numbers[i2..<i3])

        var temp1 = 0, temp2 = 0

        for i in 0...8 {
            let start = numbers.index(numbers.startIndex, offsetBy: i)
            let end = numbers.index(numbers.startIndex, offsetBy: i+1)
            let char = Int(numbers[start..<end])

            temp1 += char! * (10 - i)
            temp2 += char! * (11 - i)
        }

        temp1 %= 11
        temp1 = temp1 < 2 ? 0 : 11-temp1

        temp2 += temp1 * 2
        temp2 %= 11
        temp2 = temp2 < 2 ? 0 : 11-temp2

        return temp1 == d1 && temp2 == d2
    }
}
