//
//  DeterminateProgressView.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 04/09/2024.
//

import SwiftUI

struct DeterminateProgressView: View {
    @State private var progress: Double = 20.0 //'value' parameter of ProgressView() has to be a Float/Double not an Int.
    @State private var dateRange = Date()...Date().addingTimeInterval(10 * 60)
    
    var body: some View {
        VStack(spacing: 0){
            ProgressView(value: progress, total: 100){ //ProgressView(value:,total:,label:{}) but shortened into a closure.
                Text("Processing...")
            } currentValueLabel: {
                Text("Current progress: \(Int(progress))%") //Parse for Int to remove decimal point & make it more presentable.
            }
            .progressViewStyle(.linear) //Or automatic(default)/circular. Default if property ommitted.
            
            //ProgressView spanning a date range(updates automatically as per defined interval)
            ProgressView(timerInterval: dateRange, countsDown: true){
                Text("Grocery reaching your doorstep soon...")
            }
            
            Button {
                if progress < 100 {
                    self.progress = progress + 20
                }
            } label: {
                Text("Increase progress")
                    .frame(width: 200, alignment: .center)
                    .padding([.top, .bottom], 10)
                    .background(Color(.red))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .animation(.easeInOut(duration: 2), value: 0)
            }
        }
        //.frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
        //.edgesIgnoringSafeArea(.top) //Removes space at the top
    }
}

#Preview {
    DeterminateProgressView()
}
