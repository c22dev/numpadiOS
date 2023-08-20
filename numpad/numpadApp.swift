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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
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
                                TextField("IP", text: $ip2)
                                Button("Done") {
                                    ip = ip2
                                    manualIPSheet = false
                                    qrScannerSheet = false
                                }
                            }
                            .interactiveDismissDisabled(true)
                        }
                    }
                    .interactiveDismissDisabled(true)
                }
        }
    }
}
