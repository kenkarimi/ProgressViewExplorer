//
//  IndeterminateSpinnerProgressView.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 04/09/2024.
//

import SwiftUI

struct IndeterminateProgressView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular) //automatic(default)/linear. Default if property ommitted.
        
        ProgressView("Loading...") //ProgressView(_ titleKey:)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        
        ProgressView { //ProgressView(label: {}) but shortened into a closure.
            HStack {
                Image(systemName: "hand.raised")
                Text("Please wait...")
            }
            .foregroundColor(.red) //instead of setting the color on each of the two individual items.
        }
        
        //Changing the size(regular is the default)
        ProgressView()
            .controlSize(.mini)
        ProgressView()
            .controlSize(.small)
        ProgressView()
            .controlSize(.regular)
        ProgressView()
            .controlSize(.large)
        ProgressView("Loading...") //The spinner enlarges but the title does not.
            .controlSize(.extraLarge)
            .tint(.red)
    }
}

#Preview {
    IndeterminateProgressView()
}
