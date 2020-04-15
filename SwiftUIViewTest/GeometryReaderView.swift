//
//  GeometryReaderView.swift
//  SwiftUIViewTest
//
//  Created by Shota Nishizawa on 2020/04/15.
//  Copyright © 2020 Shota Nishizawa. All rights reserved.
//

import SwiftUI

struct GeometryReaderView : View {
    let halfScreenWidth = UIScreen.main.bounds.width / 2
    let magnification:CGFloat = 1.8
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach((0...10), id: \.self) { _ in
                    GeometryReader { geometry in
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.blue)
                            .scaleEffect(max(1, -abs(self.magnification / self.halfScreenWidth * (geometry.frame(in: .global).midX - self.halfScreenWidth)) + self.magnification))
                    }
                    .frame(width: 100, height: self.magnification * 100)
                    .padding()
                }
            }
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
