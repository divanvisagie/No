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
    @State var start: CGFloat = 25.0
    let temple = Temple()
    
    var body: some View {
        ZStack {
            Color("AppBackground")
            .edgesIgnoringSafeArea(.all)
        
            VStack() {
                Spacer()
                CircularSliderView(currentValue: $start)
                    .frame(height: 320)
                    .frame(width: 320)
                    
                Text("\(start, specifier: "%.0f")")
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
        temple.playGong()
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
