//
//  SwiftUI+extensions.swift
//  VIP+State+Router
//
//  Created by FIX PRICE on 10/23/24.
//

import SwiftUI

extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else {
            return nil
        }
        self = .init(uiImage: image)
    }
}

struct SpinnerView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    // Simulates a delay in content loading
                    // Perform transition to the next view here
                }
            }
    }
}
