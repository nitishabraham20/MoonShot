//
//  CustomDivider.swift
//  MoonshotSwiftUI
//
//  Created by Nitish on 19/04/23.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 3)
            .foregroundColor(.lightBackground)
            .padding(.top)
    }
}

struct CustomDivider_Previews: PreviewProvider {
    static var previews: some View {
        CustomDivider()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
