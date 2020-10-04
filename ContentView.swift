//
//  ContentView.swift
//  counter
//
//  Created by Yooun HyungKyun on 2020/10/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    var body: some View {
        VStack {
            Text("스탑 워치")
                .font(.largeTitle)
                .offset(x:0, y:-150)
            Text(String(format: "%.1f초", stopWatchManager.secondsElapsed))
                .font(.largeTitle)
            if (self.stopWatchManager.mode == .stopped) {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "시작", buttonColor: .blue)
                }
            }
            if (self.stopWatchManager.mode == .running) {
                Button(action: {self.stopWatchManager.pause()}) {
                    TimerButton(label: "일시 정지", buttonColor: .orange)
                }
            }
            if (self.stopWatchManager.mode == .paused) {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "시작", buttonColor: .blue)
                }
            }
            Button(action: {self.stopWatchManager.reset()}) {
                TimerButton(label: "초기화", buttonColor: .red)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton : View {
    let label : String
    let buttonColor : Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(buttonColor)
                .cornerRadius(10)
                .frame(width: 200, height: 30, alignment: .center)
            Text(label)
                .foregroundColor(.white)
                .padding(.horizontal, 90)
                .cornerRadius(10)
        }
    }
}
