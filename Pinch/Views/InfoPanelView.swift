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
    
    var body: some View {
        HStack{
            //MARK: HOTSPOT
            Image(systemName: doubleCircle)
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
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
        }
    }
}

#Preview {
    InfoPanelView(scale: 1, offset: .zero)
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
}
