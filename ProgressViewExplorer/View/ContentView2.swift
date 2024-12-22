//
//  ContentView2.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 05/09/2024.
//

import SwiftUI

struct ContentView2: View {
    @State private var indeterminate_alert_progress_visibility = false
    @State private var indeterminate_alert_progress_message: String = "Confirming credentials..."
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    self.indeterminate_alert_progress_visibility.toggle()
                } label: {
                    Text("Progress Dialog")
                        .frame(width: 200, alignment: .center)
                        .padding([.top, .bottom], 10)
                        .background(Color(.red))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .animation(.easeInOut(duration: 2), value: 0)
                }
            }
            if self.indeterminate_alert_progress_visibility {
                CustomIndeterminateAlertProgressView(
                    message: indeterminate_alert_progress_message
                )
            }
        }
        //.frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContentView2()
}
