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
    @State private var qrScannerSheet = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    qrScannerSheet.toggle()
                }
                .sheet(isPresented: $qrScannerSheet) {
                    CodeScannerView(codeTypes: [.qr]) { response in
                        if case let .success(result) = response {
                            ip = result.string
                            qrScannerSheet = false
                        }
                    }
                }
        }
    }
}
