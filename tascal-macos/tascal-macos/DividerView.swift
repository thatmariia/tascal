//
//  DividerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//
import SwiftUI

struct DividerView: View {
    
    var editing: Bool
    
    var body: some View {
        Divider().background(editing ? ColorSecondary : ColorPrimary)
    }
}
