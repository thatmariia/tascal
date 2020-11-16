//
//  NSTextField.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import Foundation
import SwiftUI

extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
