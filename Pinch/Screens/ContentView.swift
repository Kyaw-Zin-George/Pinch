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
    //MARK: Function
    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                
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
                            resetImageState()
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
                                    resetImageState()
                                }
                            })
                    )
                //MARK: Magnification
                    .gesture(
                        MagnificationGesture()
                            .onChanged{ value in
                                withAnimation(.linear(duration: 1)){
                                    if imageScale >= 1 && imageScale <= 5{
                                        imageScale = value
                                    }else if imageScale > 5{
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded({_ in
                                if imageScale > 5 {
                                    imageScale = 5
                                }else if imageScale <= 1 {
                                    resetImageState()
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
            //MARK: INFO PANEL
                .overlay(
                    InfoPanelView(scale: imageScale, offset: imageOffset)
                        .padding(.horizontal)
                        .padding(.top,30)
                    ,alignment: .top
                    
                )
            //MARK: CONTROLS
                .overlay(
                    Group{
                        HStack{
                            //Scale down
                            Button{
                                withAnimation(.spring()){
                                    if imageScale > 1 {
                                        imageScale -= 1
                                        if imageScale <= 1 {
                                            imageScale = 1
                                        }
                                    }
                                }
                            }label:{
                                ControlImageView(icon: magMinus)
                            }
                            //Reset
                            Button{
                                resetImageState()
                            }label:{
                                ControlImageView(icon: magArrDiagonal )
                            }
                            //Scale up
                            Button{
                                withAnimation(.spring()){
                                    if imageScale < 5 {
                                        imageScale += 1
                                        if imageScale >= 5 {
                                            imageScale = 5
                                        }
                                    }
                                }
                            }label:{
                                ControlImageView(icon: magPlus)
                            }
                        }//Controls
                        .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .opacity(isAnimating ? 1 : 0)
                    }
                        .padding(.bottom,30),alignment:.bottom
                )
        }
    }
}

#Preview {
    ContentView()
}
