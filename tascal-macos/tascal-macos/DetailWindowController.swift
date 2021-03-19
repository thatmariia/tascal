//
//  DetailWindowController.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 19/03/2021.
//

import Foundation
import Cocoa
import SwiftUI

class DetailWindowController<RootView : View>: NSWindowController {
    convenience init(rootView: RootView) {
        let hostingController = NSHostingController(rootView: rootView.frame(width: 400, height: 500))
        let window = NSWindow(contentViewController: hostingController)
        window.setContentSize(NSSize(width: 400, height: 500))
        self.init(window: window)
    }
}
