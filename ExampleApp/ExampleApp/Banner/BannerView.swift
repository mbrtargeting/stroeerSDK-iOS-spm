//
//  BannerView.swift
//  SimpleAdTest
//
//  Created by Hyungon Kim on 22/07/2024.
//

import Foundation
import SwiftUI

struct BannerView : View
{
    @State private var size1: CGSize = .zero
    @State private var size2: CGSize = .zero
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
            }
            
            Spacer()
            
            BannerViewRepresentable(
                slotId: "banner",
                onAdSize: { size in
                    self.size1 = size
                }
            )
            .frame(width: size1.width, height: size1.height)
            
            BannerViewRepresentable(
                slotId: "banner",
                onAdSize: { size in
                    self.size2 = size
                }
            )
            .frame(width: size2.width, height: size2.height)
            
            Spacer()
        }
        .background(
            Color("Background")
        )
    }
}
