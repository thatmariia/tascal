//
//  ContentView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        VSplitView{
            TaskManagerView()
            Divider()
            CalView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        //.background(Color.black.opacity(0.3))
        //.blendingMode(NSVisualEffectView.BlendingMode.behindWindow)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
