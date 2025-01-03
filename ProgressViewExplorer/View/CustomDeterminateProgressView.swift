//
//  CustomIndeterminateProgressView.swift
//  ProgressViewExplorer
//
//  Created by Kennedy Karimi on 05/09/2024.
//

import SwiftUI

/*Unlike with Android where the linear progress bar can be indeterminte, in SwiftUI, every linear progress view is determinate. As such, we have to make do with this if we're in need of adding a progress view on top of a view as we do in android.
 */
struct CustomDeterminateProgressView: View {
    @Binding var determinate_bar_visibility: Bool
    @Binding var progress: Double //'value' parameter of ProgressView() has to be a Float/Double not an Int.
    var in_between_number: Double //We randomize the 'in-between' number so that it's not immediately obvious to the user that this is a fake determinate progress view because it pauses at the same place all the time before completion.
    let timer = Timer.publish(every: Double.random(in: 0.2...1.0), on: RunLoop.main, in: RunLoop.Mode.common).autoconnect()
    let max_progress: Double = 100
    
    var body: some View {
        if self.determinate_bar_visibility {
            ProgressView(value: progress, total: 100){ //ProgressView(value:,total:,label:{}) but shortened into a closure.
                //Text("Please wait...")
            } currentValueLabel: {
                //Text("\(Int(progress))%") //Parse for Int to remove decimal point & make it more presentable.
            }
            .padding(.bottom, 2)
            .tint(.red) //progress bar color.
            //.foregroundStyle(.black) //Title & label color. Default is black & gray respectively.
            .background(.white)
            .onReceive(timer) { _ in
                let interval: Double = Double.random(in: 5...15) //Interval varies and can be 5 up to 15.
                print("Progress Interval: \(interval)")
                if progress + interval <= in_between_number {
                    progress = progress + interval
                }
            }
            .onChange(of: progress) { oldValue, newValue in
                let interval: Double = Double.random(in: 0.2...1.0)
                print("Time Interval: \(interval)")
                DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: { //Give it a split second to show it got to 100 before erasing it.
                    if newValue == max_progress {
                        determinate_bar_visibility = false
                    }
                })
            }
        } //If conditional
    }
}

struct CustomDeterminateProgressViewHolder: View {
    @State private var determinate_bar_visibility: Bool = true
    @State private var progress: Double = 15
    var in_between_number: Double
    
    var body: some View {
        CustomDeterminateProgressView(
            determinate_bar_visibility: $determinate_bar_visibility,
            progress: $progress,
            in_between_number: in_between_number
        )
    }
}
#Preview {
    CustomDeterminateProgressViewHolder(
        in_between_number: 70
    )
}
