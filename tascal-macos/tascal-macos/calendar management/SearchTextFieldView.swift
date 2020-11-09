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
            
            Image(systemName: "magnifyingglass.circle.fill")
        ZStack {
            
            if search.isEmpty {
                Text("Search")
                    .foregroundColor(Color(.separatorColor))
                Spacer()
            }
            TextField("", text: $search) { (changed) in
            }
            .onChange(of: search, perform: { (val) in
                envi.search = val
                //TODO:: do the search
            })
            .textFieldStyle(PlainTextFieldStyle())
            .frame(minWidth: 70)
            
            
        }
        }
        .frame(minWidth: 90)
        .padding(EdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10))
        .modifier(ToolbarStyleModifier())
        
        
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}
