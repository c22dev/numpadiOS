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
                                Text("Numpad is an app made by diyara3 (numpad touches) and c22dev (back-end, setup, qr-code, server) that allows you to use your phone as a numpad on your computer.")
                            }
                            
                            Section(header: Text("Step 1")) {
                                Text("Download the latest node.js build on your computer and install it (windows only). If you're on macOS, make sure brew is installed and run :")
                                VStack {
                                    Text("brew install npm")
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
                                    UIApplication.shared.open(URL(string: "https://nodejs.org/en/download")!)
                                }
                                .buttonStyle(LinkButtonStyle())
                            }
                            
                            Section(header: Text("Step 2")) {
                                Text("Download repo as zip on your PC/Mac and cd to the directory using your computer's terminal.")
                                Button("Open repo") {
                                    UIApplication.shared.open(URL(string: "https://github.com/diyar2137237243/numpad")!)
                                }
                                .buttonStyle(LinkButtonStyle())
                            }
                            
                            Section(header: Text("Step 3")) {
                                Text("Install dependencies by running this exact command.")
                                VStack {
                                    Text("npm install express robotjs qrcode node-pty iface")
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
                                Text("Launch the server.")
                                VStack {
                                    Text("node server.js")
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
                            
                            Section(header: Text("Step 5")) {
                                Text("Congratulations! If you haven't encountered any errors, you have finished the setup. To restart everything, you'll have to repeat steps 2 (only cd part) and 4.")
                            }
                        }
                        .navigationTitle("Setup")
                        .environment(\.defaultMinListRowHeight, 50)
                    }
                    .interactiveDismissDisabled(true)
                    Button("Done !") {
                        hasLaunchedBefore = true
                        firsTime = false
                        qrScannerSheet.toggle()
                    }
                    .buttonStyle(DangerButtonStyle())
                    .padding()
                }
        }
    }
}
