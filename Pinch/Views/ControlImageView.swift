//
//  ControlImageView.swift
//  Pinch
//
//  Created by Kyaw Thant Zin(George) on 2/17/25.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
             .font(.system(size: 36))
    }
}

#Preview {
    ControlImageView(icon: "plus.magnifyingglass")
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
}
