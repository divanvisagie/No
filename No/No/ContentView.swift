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
    @State var start: CGFloat = 25.0
    let temple = Temple()
    
    
    
    
    var body: some View {
        VStack {
            CircularSliderView(currentValue: $start)
                .padding(.horizontal)
                .frame(height: 300)
                
            Text("\(start) is the number")
                //.padding(.top, -195.0)
                //.position(x: 0, y: 0)
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

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 240, height: 420, alignment: .center)
            .previewLayout(.sizeThatFits)
        
    }
}
#endif
