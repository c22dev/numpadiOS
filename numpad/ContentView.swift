//
//  ContentView.swift
//  numpad
//
//  Created by deez nuts enjoyer on 12.08.23.
//

import SwiftUI

import LocalConsole

let consoleManager = LCManager.shared

class HapticManager {
    
    static let instance = HapticManager()

    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }

    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

}


struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button("1") {
                    consoleManager.print("Hello, World! :D 1 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("2") {
                    print("pressed 2")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                
                Button("3") {
                    print("pressed 3")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
            }
                
            HStack {
                
                Button("4") {
                    print("pressed 4")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                
                Button("5") {
                    print("pressed 5")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                
                Button("6") {
                    print("pressed 6")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
            }
                
            HStack {
                
                Button("7") {
                    print("pressed 7")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                
                Button("8") {
                    print("pressed 8")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                
                Button("9") {
                    print("pressed 9")
                    HapticManager.instance.impact(style: .soft)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
