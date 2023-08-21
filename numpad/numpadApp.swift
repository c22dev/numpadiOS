//
//  numpadApp.swift
//  numpad
//
//  Created by diyara3 on 12.08.23.
//  First edit by Constantin Clerc on 20.08.23.
//

import SwiftUI
import AVFoundation
import Network

@main
struct numpadApp: App {
    @State private var firsTime = false
    @State private var qrScannerSheet = false
    @State private var manualIPSheet = false
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
    @AppStorage("isCameraAuthorized") var isCameraAuthorized: Bool = false
    @AppStorage("isNetworkAuthorized") var isNetworkAuthorized: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    if !hasLaunchedBefore {
                        firsTime.toggle()
                    }
                    if !isCameraAuthorized {
                        AVCaptureDevice.requestAccess(for: .video) { granted in
                            DispatchQueue.main.async {
                                isCameraAuthorized = true
                            }
                        }
                    }
                    if !isNetworkAuthorized {
                        sendNumToServ(intValue: 22, ipAddress: "192.168.1.1")
                        isNetworkAuthorized = true
                    }
                    if hasLaunchedBefore == true {
                        qrScannerSheet.toggle()
                    }
                    UIApplication.shared.isIdleTimerDisabled = true
                }
                .sheet(isPresented: $qrScannerSheet) {
                    QRScanningView(qrScannerSheet: $qrScannerSheet, manualIPSheet: $manualIPSheet)
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
                                    Text("https://cclerc.live/nd/")
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
                                    UIApplication.shared.open(URL(string: "https://cclerc.live/nd/")!)
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
                                    hasLaunchedBefore = true
                                    firsTime = false
                                    qrScannerSheet.toggle()
                                }
                                .buttonStyle(DangerButtonStyle())
                                .padding()
                            }
                        }
                        .navigationTitle("Setup")
                        .environment(\.defaultMinListRowHeight, 50)
                    }
                    .interactiveDismissDisabled(true)
                }
        }
    }
}
