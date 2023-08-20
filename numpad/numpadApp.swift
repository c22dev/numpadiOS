//
//  numpadApp.swift
//  numpad
//
//  Created by diyara3 on 12.08.23.
//  First edit by Constantin Clerc on 20.08.23.
//

import SwiftUI
import CodeScanner

var ip: String = ""

@main
struct numpadApp: App {
    @State var ip2: String = ""
    @State private var qrScannerSheet = false
    @State private var manualIPSheet = false
    @State private var firsTime = false
    @AppStorage("hasLaunchedBefore") var hasLaunchedBefore: Bool = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    if !hasLaunchedBefore {
                        firsTime.toggle()
                    }
                    if hasLaunchedBefore == true {
                        qrScannerSheet.toggle()
                    }
                }
                .sheet(isPresented: $qrScannerSheet) {
                    VStack {
                        Text("Please scan provided QR Code to continue")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                            .multilineTextAlignment(.center)
                        CodeScannerView(codeTypes: [.qr]) { response in
                            if case let .success(result) = response {
                                ip = result.string
                                qrScannerSheet = false
                            }
                        }
                        .frame(width: 300, height: 300)
                        .cornerRadius(25)
                        Button("or input IP manually...") {
                            manualIPSheet.toggle()
                        }
                        .font(.footnote)
                        .foregroundColor(.blue)
                        .padding(.top, 8)
                        .sheet(isPresented: $manualIPSheet) {
                            VStack{
                                Text("Please input IP Adress to continue")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                Text("You can press ',' for dots in your IP adress.")
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .padding(.bottom)
                                    .multilineTextAlignment(.center)
                                TextField("IP", text: $ip2)
                                    .keyboardType(.decimalPad)
                                    .onChange(of: ip2) { newValue in
                                        ip2 = newValue.replacingOccurrences(of: ",", with: ".")
                                    }
                                    .padding(10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                    )
                                    .frame(width: 300)
                                    .multilineTextAlignment(.center)
                                Button("Done") {
                                    ip = ip2
                                    manualIPSheet = false
                                    qrScannerSheet = false
                                }
                                .padding()
                            }
                            Button("or scan QR code...") {
                                manualIPSheet = false
                            }
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .padding(.top, 8)
                            .interactiveDismissDisabled(true)
                        }
                    }
                    .interactiveDismissDisabled(true)
                }
                .sheet(isPresented: $firsTime) {
                    // credit to haxi0 for his setup view
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
