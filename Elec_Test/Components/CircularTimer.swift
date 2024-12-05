//
//  CustomCircularProgressBar.swift
//  iosApp
//
//  Created by Mohamed Alwakil on 20220926.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI
import Foundation
import Combine
/**
 # ``CircularTimer`` is a circle shaped progress bar.
  ``Time``  the Total time in hours, minutes, seconds
  ``progress``  progress percentage 0.0 to 1.0 ex. 0.3 mean 70% of time will load.

 # Example of usage:
 ```swift

 progress start from 0.0 and finish 1.0

 CustomCircularProgressBar(
 time: CustomCircularProgressBar.Time(hours: 0, minutes: 1, seconds: 0),
 progress: 0.0
 )
 } ```
 */

struct CircularTimer: View {
    // Mark property as private since we can pass value to init
    @ObservedObject private var viewModel: CircularTimerViewModel
    private let strokeWidth = CGFloat(8)
    
    init(viewModel: CircularTimerViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 16) {
                ZStack {

                    Circle()
                        .stroke(lineWidth: strokeWidth)
                        .foregroundColor(.el_darkGray)

                    Circle()
                        .trim(from: 0, to: viewModel.progress)
                        .stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round, lineJoin: .round))
                        .foregroundColor(.el_BlueGray)

                    Circle()
                        .trim(from: 0, to: viewModel.progress)
                        .stroke(style: StrokeStyle(lineWidth: strokeWidth, lineCap: .square, lineJoin: .round))
                        .foregroundColor(.el_BlueGray)
                }
                .frame(width: proxy.size.width * 0.7, alignment: .center)
                .rotationEffect(.degrees(90))
                .animation(.spring(), value: viewModel.progress)
                .overlay(
                    Text(
                        viewModel.textFromTimeInterval()
                    )
                    .monospacedDigit()
                )

            }
        }
    }
}

struct CircularTimer_Previews: PreviewProvider {

    static var previews: some View {
        CircularTimer(viewModel: CircularTimerViewModel(interval: 10, progress: 0.7))
    }
}
