//
//  LaunchScreenView.swift
//  ImageCarouselSwiftUI
//
//  Created by Neosoft on 28/07/24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("CarGo")
                .resizable()
                .frame(width: SizeConstants.launchImageWidth, height: SizeConstants.launchImageHeight)
                .aspectRatio(contentMode: .fit)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CustomColor.background)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
