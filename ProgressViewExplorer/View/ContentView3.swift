//
//  ContentView3.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 05/09/2024.
//

import SwiftUI

struct ContentView3: View {
    @State private var determinate_bar_visibility = false //Unlike with Android where the linear progress bar can be indeterminte, in SwiftUI, every linear progress view is determinate.
    @State private var determinate_bar_progress: Double = 15.0
    @State private var determinate_bar_in_between_number: Double = 70.0
    
    var body: some View {
        VStack(spacing: 0) {
            CustomDeterminateProgressView(
                determinate_bar_visibility: $determinate_bar_visibility,
                progress: $determinate_bar_progress,
                in_between_number: determinate_bar_in_between_number
            )
            Button {
                self.determinate_bar_progress = 15.0
                self.determinate_bar_in_between_number = Double.random(in: 55..<90) //Can be 65 to 89
                print("Random: \(determinate_bar_in_between_number)")
                self.determinate_bar_visibility = true
            } label: {
                Text("Show Bar")
                    .frame(width: 200, alignment: .center)
                    .padding([.top, .bottom], 10)
                    .background(Color(.red))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .animation(.easeInOut(duration: 2), value: 0)
            }
            Button {
                //To complete the task, we turn the progress view's progress to 100, which in turn triggers the onChange on the other side that turns determinate_bar_visibility to false.
                self.determinate_bar_progress = 100
            } label: {
                Text("Complete Task")
                    .frame(width: 200, alignment: .center)
                    .padding([.top, .bottom], 10)
                    .background(Color(.red))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .animation(.easeInOut(duration: 2), value: 0)
            }
            .padding(.top, 10)
        }
        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView3()
}
