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
    @State var hovering = false
    
    var body: some View {
        
        HStack {
            Button(action: {
                envi.is_searching.toggle()
            }, label: {
                Image(systemName: "magnifyingglass")
            })
            .buttonStyle(PlainButtonStyle())
            .onHover { (hov) in
                hovering = hov
            }
            
            
            if envi.is_searching && envi.search_width > 80 {
                ZStack {
                    
                    if search.isEmpty {
                        HStack {
                            Text("Search")
                                .foregroundColor(Color(.separatorColor))
                            Spacer()
                        }
                    }
                    HStack {
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
                    .modifier(TextFieldClearButton(text: $search))
                    .frame(width: envi.search_width-80)
                    }
                    
                }
                
            }
             
            
        }
        .frame(width: (envi.is_searching && envi.search_width > 80) ? envi.search_width-60 : 20)
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier(hovering: hovering && !envi.is_searching))
        
        
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}
