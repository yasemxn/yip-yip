//
//  Extensions.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        
    }
}
