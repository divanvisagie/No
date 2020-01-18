//
//  ContentView.swift
//  No
//
//  Created by Divan Visagie on 2020/01/18.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import SwiftUI
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

struct ContentView: View {
    @State var greetingText = "HelloWorld"
    let temple = Temple()
    
    
    
    var body: some View {
        VStack {
            Button(action: playGong) {
                Text("Play Gong")
            }
        }
    }
    
    func playGong() -> Void {
        
        //let sound = Bundle.main.path(forResource: "TempleBell", ofType: "mp3")
        
        temple.playGong()
       
        // to play sound
       // AudioServicesPlaySystemSound (systemSoundID)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
