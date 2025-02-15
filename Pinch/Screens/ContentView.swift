//
//  ContentView.swift
//  Pinch
//
//  Created by Kyaw Thant Zin(George) on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    //MARK: Property
    @State private var isAnimating : Bool = false
    @State private var imageScale : CGFloat = 1
    @State private var imageOffset : CGSize = .zero
    
    var body: some View {
        NavigationView{
            ZStack{
                //MARK: Page
                Image(frontMagCover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1:0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                //MARK: ON TAP GESTURE
                    .onTapGesture(count:2) {
                        if imageScale == 1 {
                            withAnimation(.spring()){
                                imageScale = 5
                            }
                        }else {
                            withAnimation(.spring()){
                                imageScale = 1
                            }
                        }
                    }
                //MARK: DRAG GESTURE
                    .gesture(
                        DragGesture()
                        .onChanged{ value in
                            withAnimation(.linear(duration: 1)){
                                imageOffset = value.translation
                            }
                        }
                            .onEnded({ _ in
                                if imageScale <= 1{
                                    withAnimation(.spring()) {
                                        imageScale = 1
                                        imageOffset = .zero
                                    }
                                }
                            })
                    )
                    
                    
                    
            }.navigationTitle("Pinch and Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            }
    }
}

#Preview {
    ContentView()
}
