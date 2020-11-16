//
//  SidebarView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 16/11/2020.
//

import Foundation
import SwiftUI


/*struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                //Caption
                Text("Services")
                //Navigation links
                //Replace "ContentView" with your destination
                Text("More")
                Divider()
            }
            .listStyle(SidebarListStyle())
            
            .navigationTitle("Explore")
            //Set Sidebar Width (and height)
            .frame(minWidth: 150, idealWidth: 250, maxWidth: 300)
            .toolbar{
                //Toggle Sidebar Button
                ToolbarItem(placement: .navigation){
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            }
            //Default View on Mac
            ContentView()
        }
    }
}*/

// Toggle Sidebar Function
func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

 

struct SidebarView: View {
    var body: some View {
        List(1..<100) { i in
            Text("Row \(i)")
        }
        .listStyle(SidebarListStyle())
    }
}
