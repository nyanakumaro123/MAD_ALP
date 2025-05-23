//
//  HomeViewModel.swift
//  MAD_ALP
//
//  Created by Student on 22/05/25.
//

import Foundation
import WatchConnectivity

class ExerciseViewModel: NSObject, ObservableObject, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        <#code#>
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        <#code#>
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        <#code#>
    }
    
    // Init
    @Published var exercises = [Exercise]()
    var session: WCSession
    
    init(session: WCSession = .default) {
        // Watch
        self.session = session
        
        super.init()
        session.delegate = self
        session.activate( )
    }
}
