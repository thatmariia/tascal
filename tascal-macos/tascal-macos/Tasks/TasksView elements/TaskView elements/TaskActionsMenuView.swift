//
//  TaskActionsMenuView.swift
//  tascal-macos
//
//  Created by Mariia Turchina on 09/11/2020.
//

import SwiftUI

struct TaskActionsMenuView: View {
    
    @Binding var editing: Bool
    @State var showing: Bool = false
    
    var body: some View {
        //Image(systemName: "ellipsis")
        //    .foregroundColor(Color.accentColor)
        //    .rotationEffect(.degrees(90))
        //    .contextMenu
        
        Button(action: {
            showing = true
        }, label: {
            Image(systemName: "ellipsis.circle.fill")
                .foregroundColor(Color.accentColor)
                //.rotationEffect(.degrees(90))
                .frame(width: 10)
                /*.overlay(
                    Rectangle()
                        .stroke(Color(.separatorColor).opacity(0.0),
                            //ColorSecondary.opacity(editing ? 1.0 : 0.5),
                                lineWidth: 1)
                )*/
        })
        .popover(isPresented: $showing, content: {
            HStack {
                Button(action: {
                    showing = false
                    //TODO:: duplicate task
                }, label: {
                    Image(systemName: "plus.square.on.square")
                })
                
                Divider()
                
                Button(action: {
                    showing = false
                    editing = true
                }, label: {
                    Image(systemName: "square.and.pencil")
                })
                
                Divider()
                
                Button(action: {
                    showing = false
                    //TODO:: delete task
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(Color.red)
                })
            }
            .padding()
            .buttonStyle(PlainButtonStyle())
        })
        .buttonStyle(PlainButtonStyle())
        //
        
        /*Menu {
            Button(action: {
                //TODO:: duplicate task
            }, label: {
                Image(systemName: "plus.square.on.square")
            })
            
            Button(action: {
                editing = true
            }, label: {
                Image(systemName: "square.and.pencil")
            })
            
            Button(action: {
                //TODO:: delete task
            }, label: {
                Image(systemName: "trash")
                    .foregroundColor(Color.red)
            })
        } label: {
            Image(systemName: "ellipsis")
                .foregroundColor(Color.accentColor)
                .rotationEffect(.degrees(90))
        }
        .menuStyle(BorderlessPullDownMenuButtonStyle())
        .frame(width: 20)*/
        //.menuStyle(BorderlessButtonMenuStyle())
        
    }
}
