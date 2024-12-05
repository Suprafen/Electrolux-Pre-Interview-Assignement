//
//  ContentView.swift
//  Elec_Test
//
//  Created by Jameel Shammr on 28/10/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: CircularTimerViewModel = CircularTimerViewModel(interval: CircularTimerViewModel.Time(hours: 1, minutes: 0, seconds: 5).interval, progress: 0.0)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            CircularProgressBar(progress: viewModel.progress, text: viewModel.textFromTimeInterval())
            CircularTimer(viewModel: viewModel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
