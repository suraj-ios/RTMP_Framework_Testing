//
//  AppDelegate.swift
//  TestFrameworkNew
//
//  Created by Suraj Singh on 25/08/21.
//

import UIKit
import AVFoundation
import RTMPFramework
import Logboard

let logger = Logboard.with("com.haishinkit.Exsample.iOS")

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let rtmpFrameworkObject = RTMPViewController()
        rtmpFrameworkObject.serverUrl = "rtmps://live-api-s.facebook.com:443/rtmp/"
        rtmpFrameworkObject.streamKey = "FB-284845230113884-0-AbwARWzTK7bXayCl"
        
        let session = AVAudioSession.sharedInstance()
        do {
            
            if #available(iOS 10.0, *) {
                try session.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            } else {
                session.perform(NSSelectorFromString("setCategory:withOptions:error:"), with: AVAudioSession.Category.playAndRecord, with: [
                    AVAudioSession.CategoryOptions.allowBluetooth,
                    AVAudioSession.CategoryOptions.defaultToSpeaker
                ])
                try session.setMode(.default)
            }
            try session.setActive(true)
        } catch {
            rtmpFrameworkObject.logger.error(error)
        }
        
        return true
    }

    
}

