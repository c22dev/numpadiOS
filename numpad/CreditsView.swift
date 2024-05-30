//
//  CreditsView.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import SwiftUI

struct CreditsView: View {
    @State private var firsTime = false
    var body: some View {
        VStack{
            VStack {
                Text("")
                Spacer()
                Image(uiImage: Bundle.main.icon!)
                    .cornerRadius(10)
                Text("NumpadiOS")
                    .font(.title2)
                
                Text("Use your phone as a numpad for your PC !")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
            }
            Spacer()
            NavigationView {
                List {
                    Section(header: Text("Credits"), footer: Text("Not all the developers listed here are contributors, but some of their specified open sourced code are used in the app.")) {
                        LinkCell(imageName: "c22", url: "https://github.com/c22dev", title: "c22dev", contribution: "Main developer")
                        LinkCell(imageName: "diara", url: "https://github.com/diyar2137237243", title: "diyar3", contribution: "Numpad (touches/faces UI)")
                        LinkCell(imageName: "twostraws", url: "https://github.com/twostraws", title: "twostraws", contribution: "CodeScanner (QR Code to text swift lib, MIT)")
                        LinkCell(imageName: "haxi", url: "https://github.com/haxi0", title: "haxi0", contribution: "Setup View (template)")
                    }
                }
            }
            Button("re-show instructions...") {
                firsTime = true
            }
            .sheet(isPresented: $firsTime) {
                NavigationView {
                    List {
                        Section(header: Text("Welcome!")) {
                            Text("Numpad is an app that allows you to use your phone as a numpad on your computer.")
                        }
                        
                        Section(header: Text("Step 1")) {
                            Text("Open this URL on your computer (Windows/Mac/Linux) :")
                            VStack {
                                Text("https://cclerc.ch/nd/")
                                    .font(.custom("Menlo", size: 15))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .textSelection(.enabled)
                            .background (
                                Color.black
                                    .cornerRadius(5)
                            )
                            Button("Open website") {
                                UIApplication.shared.open(URL(string: "https://cclerc.ch/nd/")!)
                            }
                            .buttonStyle(LinkButtonStyle())
                        }
                        
                        Section(header: Text("Step 2")) {
                            Text("Download the corresponding file for your operating system (win/exe for windows, macos for macOS and linux for any Linux distribution).")
                        }
                        
                        Section(header: Text("Step 3 (macOS/linux only) ")) {
                            Text("Open a terminal (e.g. Terminal.app), type 'chmod +x '(there is a space after the +x) then drag-and-drop the downloaded file in the window. (Here is an example for macOS). If structure seems correct, please press enter.")
                            VStack {
                                Text("chmod +x /Users/??/Downloads/server-macos")
                                    .font(.custom("Menlo", size: 15))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .textSelection(.enabled)
                            .background (
                                Color.black
                                    .cornerRadius(5)
                            )
                        }
                        
                        Section(header: Text("Step 4")) {
                            Text("Right click then click on open from a file from a file explorer. Windows user might need to authorize firewall (please tick private networks)")

                        }
                        
                        Section(header: Text("Step 5")) {
                            Text("Congratulations! If you haven't encountered any errors, you have finished the setup. If macOS asks you to allow Terminal to control your keyboard, please do so. To restart everything, you'll have to repeat step 4.")
                        }
                        Section() {
                            Button("Done !") {
                                firsTime = false
                            }
                            .buttonStyle(DangerButtonStyle())
                            .padding()
                        }
                    }
                    .navigationTitle("Setup")
                    .environment(\.defaultMinListRowHeight, 50)
                }
            }
            .navigationTitle("Credits")
        }
    }
}
