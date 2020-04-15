//
//  ContentView.swift
//  SwiftUIViewTest
//
//  Created by Shota Nishizawa on 2020/04/15.
//  Copyright © 2020 Shota Nishizawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .frame(width: 120, height: 120)
        .background(StickyNoteView())
    }
}

struct StickyNoteView: View {
    var color: Color = .green
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: h))
                    path.addLine(to: CGPoint(x: w-m, y: h))
                    path.addLine(to: CGPoint(x: w, y: h-m))
                    path.addLine(to: CGPoint(x: w, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                }
                .fill(self.color)
                Path { path in
                    let w = geometry.size.width
                    let h = geometry.size.height
                    let m = min(w/5, h/5)
                    path.move(to: CGPoint(x: w-m, y: h))
                    path.addLine(to: CGPoint(x: w-m, y: h-m))
                    path.addLine(to: CGPoint(x: w, y: h-m))
                    path.addLine(to: CGPoint(x: w-m, y: h))
                }
                .fill(Color.black)
                .opacity(0.4)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
