//
//  StopWatchManager.swift
//  counter
//
//  Created by Yooun HyungKyun on 2020/10/04.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    @Published var secondsElapsed = 0.0
    @Published var mode : Mode = .stopped
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true)
        {
            timer in self.secondsElapsed += 0.1
        }
        mode = .running
    }
    
    func pause() {
        timer.invalidate()
        mode = .paused
    }
    
    func reset() {
        timer.invalidate()
        secondsElapsed = 0.0
        mode = .stopped
    }
}

enum Mode {
    case running
    case paused
    case stopped
}
