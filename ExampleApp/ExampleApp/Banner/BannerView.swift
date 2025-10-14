//
//  BannerView.swift
//  AdTestApp
//
//  Created by Shafee Rehman on 01/07/2025.
//

import SwiftUI

struct BannerView: View {
    @State private var bannerHeight: CGFloat = 0.0
    @State private var errorMessage: String?
    @State private var isLoaded: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                Text("Banner Ad")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            Spacer()
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            } else {
                ZStack {
                    if !isLoaded {
                        ProgressView()
                    }
                    BannerViewRepresentable(
                        adSlotId: "banner",
                        bannerHeight: $bannerHeight,
                        errorCallback: { error in
                            self.errorMessage = error
                        },
                        isLoaded: { loaded in
                            self.isLoaded = loaded
                        }
                    )
                    .frame(height: bannerHeight)
                }
            }
            
            Spacer()
        }
        .background(Color("Background").ignoresSafeArea())
        .tint(.white)
    }
}
