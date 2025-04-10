//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Kyaw Thant Zin(George) on 2/16/25.
//

import SwiftUI

struct InfoPanelView: View {
    //MARK: PROPERTIES
    var scale: CGFloat
    var offset: CGSize
    @State private var isInfoPanelVisible : Bool = false
    
    var body: some View {
        HStack{
            //MARK: HOTSPOT
            Image(systemName: doubleCircle)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut){
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            //MARK: INFO PANEL
            HStack(spacing:2){
                Image(systemName: arrowsuLdR)
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: arrowsLR)
                Text("\(offset.width)")
                Spacer()
                
                Image(systemName: arrowsUD)
                Text("\(offset.height)")
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .frame(maxWidth:420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
