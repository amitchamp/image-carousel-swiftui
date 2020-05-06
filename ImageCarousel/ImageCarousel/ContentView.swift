//
//  ContentView.swift
//  ImageCarousel
//
//  Created by Amit on 07/05/20.
//  Copyright © 2020 Tutorials. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    let images: [String] = ["Property_1", "Property_2", "Property_3", "Property_4", "Property_5", "Property_6"]

    let imageFrameSize: CGFloat = 50
    let imageFrameHeight: CGFloat = 250
    let imageMinScaleRatio: CGFloat = 0.9

    var body: some View {
        
        GeometryReader { geometry in
            ImageCarousel(index: self.$index.animation(), maxIndex: self.images.count - 1) {
                ForEach(0..<self.images.count) { index in
                    Image(self.images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width - self.imageFrameSize, height: self.imageFrameHeight)
                        .scaleEffect(self.index == index ? 1.0 : self.imageMinScaleRatio)
                        .animation(.easeInOut)
                        .cornerRadius(self.index == index ? 15 : 30)
                        .clipped()
                }
            }
        }
        .frame(height: self.imageFrameHeight + 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

