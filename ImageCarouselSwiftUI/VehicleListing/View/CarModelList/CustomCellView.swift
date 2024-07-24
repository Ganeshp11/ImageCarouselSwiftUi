//
//  CustomCellView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 23/07/24.
//

import SwiftUI

struct CustomCellView: View {
    let title: String
    let subtitle: String
    let image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 90, height: 100)
                .aspectRatio(contentMode: .fill)
                .padding(.leading)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 18,weight: .bold))
                    .padding(.vertical, 2.5)
                    .foregroundColor(Color.white)
                Text("Price: Rs. \(subtitle) Lakh")
                    .font(.system(size: 18,weight: .medium))                
                    .padding(.vertical, 2.5)
                    .foregroundColor(Color("LightGrays"))
            }
            .padding()
            Spacer()
        }
        .background(Color("CellColor"))
        .border(Color("LightGrays"), width: 0.5)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5) // inset value should be same as lineWidth in .stroke
                .stroke(Color("LightGrays"), lineWidth: 0.5)
        )
        .padding(.horizontal, 1)
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .padding(.vertical, 5)
       
    }
}

struct CustomCellView_Preview: PreviewProvider {
    static var previews: some View {
        CustomCellView(title: "Nexon", subtitle: "10", image: "Nexon")

    }
}
