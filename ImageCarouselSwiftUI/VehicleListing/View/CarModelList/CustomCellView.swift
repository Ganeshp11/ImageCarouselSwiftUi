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
                .scaledToFill()
                .frame(width: 100)
                .padding(.horizontal, 10)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 20,weight: .bold))
                    .padding(.vertical, 2.5)
                    .foregroundColor(CustomColor.fontColor)
                Text("Rs. \(subtitle) Lakh")
                    .font(.system(size: 18,weight: .medium))                
                    .padding(.vertical, 2.5)
                    .foregroundColor(CustomColor.lightFontColor)
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: 100)
        .background(Color(CustomColor.cellColor))
        .border((CustomColor.borderColor), width: 0.5)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke((CustomColor.borderColor), lineWidth: 0.5)
        )
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .shadow(color: CustomColor.cellColor,radius: 4)
    
    }
}

struct CustomCellView_Preview: PreviewProvider {
    static var previews: some View {
        CustomCellView(title: "Nexon", subtitle: "10", image: "Nexon")

    }
}
