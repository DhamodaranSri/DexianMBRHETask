//
//  UITextFieldExtention+Regex.swift
//  DexianMBRHETask
//
//  Created by OrganicFarmers on 28/02/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func isAlpahbatesWithSpace(textString: String, maximumTextLength: Int) -> Bool {

        if ((self.text?.count ?? 0) >= maximumTextLength) {
            return false
        }

        if (self.text?.count ?? 0) == 1 && textString == " " {
            return false
        }

        let alphaNum = "[a-zA-Z ]"
        let regexTest = NSPredicate(format: "SELF MATCHES %@", alphaNum)

        if (regexTest.evaluate(with: textString)==false) {
            if (textString.count==0) {
                return true
            }
            return false
        }

        return true
    }

    func isAlpahbates(textString: String, maximumTextLength: Int) -> Bool {
        
        if ((self.text?.count ?? 0) >= maximumTextLength) && textString != "" {
            return false
        }
        
        if (self.text?.count ?? 0) == 1 && textString == " " {
            return false
        }

        let alphaNum = "[a-zA-Z]"
        let regexTest = NSPredicate(format: "SELF MATCHES %@", alphaNum)
        
        if (regexTest.evaluate(with: textString)==false) {
            if (textString.count==0) {
                return true
            }
            return false
        }
        
        return true
    }
}
