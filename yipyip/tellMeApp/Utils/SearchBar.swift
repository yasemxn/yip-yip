//
//  SearchBar.swift
//  tellMeApp
//
//  Created by Yasemin Karaca on 16.05.2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            
            TextField("Search..", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                )
                
            
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
//                    UIApplication.shared.endEditing()
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                    
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
        
//        ForEach((0..<20).filter({ "\($0)".contains(text) || text.isEmpty}), id: \.self) { num in
//            HStack {
//                Text("\(num)")
//                
//            }
//        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
