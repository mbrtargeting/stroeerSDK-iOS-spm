//
//  ContentView.swift
//  ExampleApp
//
//  Created by Shafee Rehman on 14/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                HStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 175, height: 35)
                        .padding(6)
                    Spacer()
                }
                
                Spacer()
                
                Button {
                    path.append(NavDestination.Banner)
                } label: {
                    Text("Banner")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 175, height: 70)
                        .background(Color.white.gradient.opacity(0.1))
                }
                
                Button {
                    path.append(NavDestination.Interstitial)
                } label: {
                    Text("Interstitial")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 175, height: 70)
                        .background(Color.white.gradient.opacity(0.1))
                }
                
                Spacer()
            }
            .background(
                Color("Background")
            )
            .navigationDestination(for: NavDestination.self) { destination in
                switch destination {
                case .Banner:
                    BannerView()
                case .Interstitial:
                    InterstitialView()
                }
            }
        }
    }
}

enum NavDestination: Hashable {
    case Banner
    case Interstitial
}

#Preview {
    ContentView()
}
