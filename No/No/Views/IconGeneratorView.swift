//
//  IconGeneratorView.swift
//  No
//
//  Created by Divan Visagie on 2020/01/19.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import SwiftUI

struct IconGeneratorView: View {
    var body: some View {
        VStack {
            CircularSliderView(currentValue: .constant(17))
        }
    }
}


#if DEBUG
struct IconGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        IconGeneratorView()
            .previewLayout(.sizeThatFits)
            .frame(width: 1024, height: 1024)
    }
}


//struct IconGeneratorView_Previews: PreviewProvider {
//    static var previews: some View {
//        IconGeneratorView()
//            .frame(width: 360, height: 820, alignment: .center)
//            .previewLayout(.sizeThatFits)
//
//    }
//}
#endif
