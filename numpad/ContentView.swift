//
//  ContentView.swift
//  numpad
//
//  Created by diyara3 on 12.08.23.
//  First edit by Constantin Clerc on 20.08.23.
//

import SwiftUI
import LocalConsole
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button("1") {
                    consoleManager.print("User pressed touch 1 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 1, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("2") {
                    consoleManager.print("User pressed touch 2 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 2, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("3") {
                    consoleManager.print("User pressed touch 3 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 3, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
                
            HStack {
                
                Button("4") {
                    consoleManager.print("User pressed touch 4 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 4, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("5") {
                    consoleManager.print("User pressed touch 5 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 5, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("6") {
                    consoleManager.print("User pressed touch 6 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 6, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
                
            HStack {
                
                Button("7") {
                     consoleManager.print("User pressed touch 7 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 7, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("8") {
                    consoleManager.print("User pressed touch 8 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 8, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
                Button("9") {
                    consoleManager.print("User pressed touch 9 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 9, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            HStack {
                Button("0") {
                    consoleManager.print("User pressed touch 0 ")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 0, ipAddress: ip)
                }
                .frame(width: 200, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                Button(".") {
                    consoleManager.print("User pressed touch .")
                    consoleManager.isVisible = true
                    HapticManager.instance.impact(style: .soft)
                    sendNumToServ(intValue: 11, ipAddress: ip)
                }
                .frame(width: 100, height: 100)
                .border(.black)
                .background(Color.black)
                .font(.largeTitle)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
