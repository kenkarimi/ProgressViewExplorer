//
//  CustomProgressAlertView.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 04/09/2024.
//

import SwiftUI

struct CustomIndeterminateAlertProgressView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let message: String
    
    var body: some View {
        HStack {
            HStack(spacing: 0) {
                ProgressView()
                    .controlSize(.regular) //default is regular.
                    .frame(minWidth: 0, maxWidth: 90, alignment: .center)
                    .tint(.red) //Spinner color. Default is gray.
                Text(message)
                    .font(Font.system(size: 16, weight: .regular))
                    .foregroundColor(Color(.red))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
            .background(.ultraThickMaterial)
            .cornerRadius(10)
            .padding([.leading, .trailing], 50)
            
        } //HStack
        .zIndex(1.0) //Controls the display order of overlapping views. Makes the transition animation between the 'show alert' button & the actual alert when the alert visibility is toggled much smoother since both overlap within the ZStack.
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(colorScheme == .light ? "ColorAlertLightColorScheme" : "ColorAlertDarkColorScheme")) //both color schemes have a 40% opacity when the asset is defined.
        .ignoresSafeArea(.all) //background extends up to the edges of the screen.
    }
}

#Preview {
    CustomIndeterminateAlertProgressView(
        message: "Message..."
    )
}
