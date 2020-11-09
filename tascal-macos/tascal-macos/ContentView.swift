//
//  ContentView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    var body: some View {
        
        GeometryReader { geom in
            VSplitView{
                
                TaskManagerView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                Divider()
                
                CalView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .frame(minHeight: geom.size.height * 0.25)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
