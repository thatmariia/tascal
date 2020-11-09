//
//  TaskManagerView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 07/11/2020.
//

import SwiftUI

struct TaskManagerView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    var bins = 3
    
    var body: some View {
        
        HStack{
            VStack {
                TasksTitleView(txt: "Tasks")
                
                if (envi.search != "") {
                    //TODO:: fix the splitview so it extends in vsplitview
                    HSplitView {
                        
                        TasksView()
                        Spacer()
                        
                        Divider()
                        
                        
                        //TODO:: add search view here
                        VStack{
                            Text("\(envi.search)")
                            Spacer()
                        }

                    }
                } else {
                    TasksView()
                    Spacer()
                }
            }
        }
    }
}
        
