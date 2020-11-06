//
//  CalManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalManagerView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    var body: some View {
        HStack {
            CalManagerButtonView(type: CalType.year)
            CalManagerButtonView(type: CalType.week)
            CalManagerButtonView(type: CalType.days)
            CalManagerButtonView(type: CalType.day)
        }
    }
}

struct CalManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CalManagerView()
    }
}