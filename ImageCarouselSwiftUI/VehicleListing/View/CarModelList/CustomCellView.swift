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
                .frame(width: SizeConstants.carImageWidth)
                .padding(.horizontal, 10)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(FontSizeClass.extraLarge)
                    .padding(.vertical, 2.5)
                    .foregroundColor(CustomColor.fontColor)
                Text(Strings.rs + subtitle + Strings.lakh)
                    .font(FontSizeClass.medium)
                    .padding(.vertical, 2.5)
                    .foregroundColor(CustomColor.lightFontColor)
            }
            .padding(.horizontal, 5)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: SizeConstants.customCellHeight)
        .background(Color(CustomColor.cellColor))
        .border((CustomColor.borderColor), width: 0.5)
        .cornerRadius(SizeConstants.radius)
        .overlay(
            RoundedRectangle(cornerRadius: SizeConstants.radius)
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
        CustomCellView(title: Strings.carName, subtitle: Strings.price, image: Strings.imageName)

    }
}
