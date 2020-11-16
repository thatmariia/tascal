//
//  ContentView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    @EnvironmentObject var tasks: TasksEnvironment
    
    var body: some View {
        
        GeometryReader { geom_window in
            VSplitView{
                
                TaskManagerView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                Divider()
                
                CalView()
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .frame(minHeight: geom_window.size.height * 0.25)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut)
            .onAppear(perform: {
                fetch_tasks()
            })
        }
        
    }
    
    fileprivate func fetch_tasks() {
        CloudKitHelper.fetch { (result) in
            switch result {
            case .success(let task):
                self.tasks.all_tasks.append(task)
                print("Successfully fetched item")
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
