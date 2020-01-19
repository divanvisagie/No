//
//  Temple.swift
//  No
//
//  Created by Divan Visagie on 2020/01/19.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import Foundation
import AVFoundation


class Temple {
    var sound: AVAudioPlayer!
    
    func playGong() {
        print("Temple wants to play gong")
        if let path = Bundle.main.path(forResource: "TempleBell", ofType: "mp3") {
            do {
                sound = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                print("Playing sound")
                sound.play()
            } catch {
                print( "Could not find file")
            }
        } else {
            print("We have failed")
        }
    }
}
