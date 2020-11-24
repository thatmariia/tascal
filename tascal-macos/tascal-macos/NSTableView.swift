//
//  NSTableView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 24/11/2020.
//

import Foundation
import SwiftUI

extension NSTableView {
  open override func viewDidMoveToWindow() {
    super.viewDidMoveToWindow()

    backgroundColor = NSColor.clear
    enclosingScrollView!.drawsBackground = false
    
  }
}

// TODO:: figure out how to remove background from focused section header
