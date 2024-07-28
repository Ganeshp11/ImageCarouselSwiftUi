//
//  SearchBarView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 23/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(CustomColor.lightFontColor)
                        .padding(.leading, 5)
                    TextField("Search car here", text: $searchText)
                        .foregroundColor(CustomColor.lightFontColor)
                        .padding(5)
                        .onTapGesture {
                            self.isEditing = true
                        }
                }
                .background(Color(CustomColor.cellColor))
                .cornerRadius(8)
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        // Dismiss keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                            .fontWeight(.semibold)
                            .foregroundColor(CustomColor.cellColor)
                    }
                    .padding(.trailing, 10)
                }
            }
            .padding(10)
        }
    }
}

