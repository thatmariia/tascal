//
//  SearchTextFieldView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct SearchTextFieldView: View {
    
    @EnvironmentObject var envi: AppEnvironment
    
    @State var search = ""
    
    var body: some View {
        
        HStack {
            Button(action: {
                envi.is_searching.toggle()
                //toggleSidebar()
            }, label: {
                Image(systemName: "magnifyingglass.circle.fill")
            })
            .buttonStyle(PlainButtonStyle())
            
            if envi.is_searching && envi.search_width > 80 {
            // TODO:: make a sidebar for search
                ZStack {
                    
                    if search.isEmpty {
                        Text("Search")
                            .foregroundColor(Color(.separatorColor))
                        Spacer()
                    }
                    TextField("", text: $search) { (changed) in
                    }
                    onCommit: {
                        //is_searching = false
                    }
                    .onChange(of: search, perform: { (val) in
                        envi.search = val
                        //TODO:: do the search
                    })
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(width: envi.search_width-80)
                    
                }
                //.isHidden(!is_searching)
            }
             
            
        }
        .frame(width: (envi.is_searching && envi.search_width > 80) ? envi.search_width-60 : 20)
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier(is_arrow: false))
        
        
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}
