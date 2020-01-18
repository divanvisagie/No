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

struct CircularSliderView : UIViewRepresentable {
    
    @Binding var currentValue: CGFloat
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    //@Binding var currentValue: Int
   
    func makeUIView(context: Context) -> CircularSlider {
          
        let circularSlider = CircularSlider()
        circularSlider.minimumValue = 0.0
        circularSlider.maximumValue = 60.0
        circularSlider.endPointValue = currentValue
        circularSlider.diskColor = .clear
        circularSlider.backgroundColor = .clear
        circularSlider.tintColor = .black;
        circularSlider.trackColor = .systemGray3;
        circularSlider.trackFillColor = .black
        circularSlider.trackShadowColor = .gray
        
        circularSlider.lineWidth = 14
        circularSlider.backtrackLineWidth = 13;
        
        circularSlider.endThumbStrokeColor = .black
        circularSlider.endThumbTintColor = .black
        
        
        circularSlider.addTarget(
                  context.coordinator,
                  action: #selector(Coordinator.updateEndpointValue(sender:)),
                  for: .valueChanged)
           
        return circularSlider
    }
   
    func updateUIView(_ circularSlider: CircularSlider, context: Context) {
        circularSlider.endPointValue = currentValue
      }
    
    class Coordinator: NSObject {
        var pageControl: CircularSliderView
       
        init(_ pageControl: CircularSliderView) {
            self.pageControl = pageControl
        }
       
        @objc func updateEndpointValue(sender: CircularSlider) {
            pageControl.currentValue = sender.endPointValue
        }
   }
    
}

#if DEBUG
struct CircularSliderView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularSliderView(currentValue: .constant(25.0))
            .frame(width: 250, height: 250, alignment: .center)
            .previewLayout(.sizeThatFits)
            .fixedSize(horizontal: true, vertical: true)
    }
}
#endif
