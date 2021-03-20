//
//  CalView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalView: View {
    
    @EnvironmentObject var dates: DatesSettings
    
    var body: some View {
        CalTypeView_Days()
        
    }
}
