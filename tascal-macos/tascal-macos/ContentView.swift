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
        
        ZStack{
        NavigationView {
            
            SidebarView()
            
            GeometryReader { geom_window in
                
                HSplitView {
                    
                    MainView(geom_window: geom_window).layoutPriority(1)
                        .frame(minWidth: 0.5*geom_window.size.width)
                    
                    if envi.is_searching {
                        SearchView()
                            .frame(minWidth: 150, idealWidth: 200)
                    }
                    
                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .animation(.easeInOut)
            .onAppear(perform: {
                fetch_tasks()
            })
            
        }
        }
        
        
    }
    
    fileprivate func SearchView() -> some View {
        Group{
            GeometryReader { geom_search in
                SearchSidebarView()
                    .onAppear(perform: {
                        self.envi.search_width = geom_search.size.width
                    })
                    .onChange(of: geom_search.size.width, perform: { (width) in
                        self.envi.search_width = width
                    })
            }
        }
    }
    
    fileprivate func MainView(geom_window: GeometryProxy) -> some View {
        VSplitView{
            
            TaskManagerView()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            
            //Divider()
            
            CalView()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .frame(minHeight: geom_window.size.height * 0.25)
                .layoutPriority(1)
        }
        .frame(minWidth: 300)
        .layoutPriority(1)
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
