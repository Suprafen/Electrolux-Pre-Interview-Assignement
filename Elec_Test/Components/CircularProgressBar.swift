
//
//  CircularProgressBar.swift
//  iosApp
//
//  Created by Vitaly on 20220721.
//  Copyright © 2022 orgName. All rights reserved.
//

import SwiftUI

/**
 # ``CircularProgressBar`` is a circle shaped progress bar.
  ``progress``  progress value with a range from 0 to 1
  ``text``  text that displayed inside of the circle

 # Example of usage:
 ```swift
     CircularProgressBar(progress: $progress, text: $text)
 ```
 */

struct CircularProgressBar: View {
    // No need for binding here, the view doesn't change passed values
    var progress: CGFloat
    var text: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 8.0)
                .foregroundColor(.el_darkGray)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.el_yellow)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            Text(text)
                .foregroundColor(.el_navy)
                .foregroundStyle(.red)
                .font(.custom("MetricLight", size: 46))
        }
        .frame(width: 234.0, height: 234.0)
    }
}
