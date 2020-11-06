//
//  CalTypeView_Week.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct CalTypeView_Week: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    var body: some View {
        Text("\(envi.date_pick)")
    }
}

struct CalTypeView_Week_Previews: PreviewProvider {
    static var previews: some View {
        CalTypeView_Week()
    }
}
