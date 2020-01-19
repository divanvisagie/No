//
//  ContentView.swift
//  No
//
//  Created by Divan Visagie on 2020/01/18.
//  Copyright © 2020 Divan Visagie. All rights reserved.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @State var greetingText = "HelloWorld"
    @State var time: CGFloat = 25.0 * 60
    @State var timer: Timer?
    
    let healthStore = HKHealthStore()
    
    let temple = Temple()
    
    var body: some View {
        ZStack {
            Color("AppBackground")
            .edgesIgnoringSafeArea(.all)
        
            VStack() {
                Spacer()
                CircularSliderView(currentValue: $time)
                    .frame(height: 320)
                    .frame(width: 320)
                    
                Text("\(time / 60, specifier: "%.0f")")
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
        activateHealthKit()
        let startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            
            if self.time < 1 {
                let endTime = Date()
                self.temple.playGong()
                self.timer?.invalidate()
                self.time = 0
                
                self.saveSessionToHealthKit(startTime: startTime, endTime: endTime)
                return
            }
            
            self.time -= 1
        })
    }
    
    func saveSessionToHealthKit(startTime: Date, endTime: Date) {
        if let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) {
            let mindfullSample = HKCategorySample(type: mindfulType, value: 0, start: startTime, end: endTime)
            healthStore.save(mindfullSample, withCompletion: { (success, error) -> Void in

                if error != nil {
                   // something happened
                   return
                }

                if success {
                   print("My new data was saved in HealthKit")
                   
                } else {
                   // something happened again
                }

            })
        }
    }
    
    func activateHealthKit() {
        let typestoRead = Set([
               HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession)!
               ])
           
         let typestoShare = Set([
               HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.mindfulSession)!
               ])
        
           self.healthStore.requestAuthorization(toShare: typestoShare, read: nil) { (success, error) -> Void in
               if success == false {
                print("solve this error\(String(describing: error))")
                   NSLog(" Display not allowed")
               }
               if success == true {
                   print("dont worry everything is good \(success)")
                   NSLog(" Integrated SuccessFully")
               }
         }
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
