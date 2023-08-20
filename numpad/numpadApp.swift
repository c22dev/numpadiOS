//
//  numpadApp.swift
//  numpad
//
//  Created by diyara3 on 12.08.23.
//  First edit by Constantin Clerc on 20.08.23.
//

import SwiftUI
import CodeScanner
import LocalConsole

let consoleManager = LCManager.shared
var ip: String = ""

@main
struct numpadApp: App {
    @State var ip2: String = ""
    @State private var qrScannerSheet = false
    @State private var manualIPSheet = false
    @State private var firsTime = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    if UserDefaults.standard.bool(forKey: "hasLaunchedBefore") == false {
                        
                        UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                    }
                    qrScannerSheet.toggle()
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
                    
                }
        }
    }
}
