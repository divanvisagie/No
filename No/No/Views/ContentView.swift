//
//  ContentView.swift
//  No
//
//  Created by Divan Visagie on 2020/01/18.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var greetingText = "HelloWorld"
    @State var time: CGFloat = 25.0
    let temple = Temple()
    @State var timer: Timer?
    
    var body: some View {
        ZStack {
            Color("AppBackground")
            .edgesIgnoringSafeArea(.all)
        
            VStack() {
                Spacer()
                CircularSliderView(currentValue: $time)
                    .frame(height: 320)
                    .frame(width: 320)
                    
                Text("\(time, specifier: "%.0f")")
                    .foregroundColor(Color("AppForeground"))
                    .padding(.vertical)
                    .padding(.top, -195.0)
                   
                Button(action: playGong) {
                    Image(systemName: "play")
                        .frame(width: 60.0, height: 60.0)
                        .accentColor(/*@START_MENU_TOKEN@*/Color("AppForeground")/*@END_MENU_TOKEN@*/)
                }
                Spacer()
            }
        }
    }
    
    func playGong() -> Void {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            
            /// If the timer has reached 0, then invalidate it
            if self.time < 1 {
                self.temple.playGong()
                self.timer?.invalidate()
                self.time = 0
                return
            }
              
            /// Otherwise decrement the counter
            self.time -= 1
        })
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 360, height: 820, alignment: .center)
            .previewLayout(.sizeThatFits)
        
    }
}
#endif
