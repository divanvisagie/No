//
//  SwiftUIView.swift
//  No
//
//  Created by Divan Visagie on 2020/01/18.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import SwiftUI

struct HelloWorldTest: View {
   @State var greetingText = "Hello World!"
    
    var body: some View {
        VStack {
            Text("\(greetingText)")
            Button(action: changeToCheese) {
                Text("Press Me")
            }
        }
    }
    
    func changeToCheese() -> Void {
        greetingText = "cheese"
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HelloWorldTest()
            .previewLayout(.sizeThatFits)
    }
}
