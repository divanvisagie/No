//
//  CircularSlider.swift
//  No
//
//  Created by Divan Visagie on 2020/01/18.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import HGCircularSlider

struct CircularSliderView : UIViewControllerRepresentable {

    
   
    func makeUIViewController(context: Context) -> UIViewController {
           let viewController = UIViewController()
        
            let frame = UIView()
            viewController.view = frame
           
                let circularSlider = CircularSlider()
                circularSlider.minimumValue = 0.0
                circularSlider.maximumValue = 1.0
                circularSlider.endPointValue = 0.2
             
            viewController.view = circularSlider
           return viewController
       }
   
    func updateUIViewController(_ viewController: UIViewController, context: Context) {
          
      }
    
}

#if DEBUG
struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderView()
            .previewLayout(.sizeThatFits)
    }
}
#endif
