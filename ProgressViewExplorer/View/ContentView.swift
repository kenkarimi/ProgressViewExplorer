//
//  ContentView.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 04/09/2024.
//

import SwiftUI

//More: https://www.swiftanytime.com/blog/progress-view-in-swiftui
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-progress-on-a-task-using-progressview

struct ContentView: View {
    @State private var progress_dialog_visibility = false
    @State private var determinate_bar_visibility = false //Unlike in android where the linear progress bar can be indeterminte, in SwiftUI, every linear progress view is determinate.
    
    var body: some View {
        VStack {
            IndeterminateProgressView()
            DeterminateProgressView()
        }
    }
}

#Preview {
    ContentView()
}
