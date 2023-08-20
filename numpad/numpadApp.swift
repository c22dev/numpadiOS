//
//  numpadApp.swift
//  numpad
//
//  Created by diyara3 on 12.08.23.
//  First edit by Constantin Clerc on 20.08.23.
//

import SwiftUI

@main
struct numpadApp: App {
    @State private var firsTime = false
    @State private var qrScannerSheet = false
    @State private var manualIPSheet = false
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
                    UIApplication.shared.isIdleTimerDisabled = true
                }
                .sheet(isPresented: $qrScannerSheet) {
                    QRScanningView(qrScannerSheet: $qrScannerSheet, manualIPSheet: $manualIPSheet)
                }
                .sheet(isPresented: $firsTime) {
                    SetupView(firsTime: $firsTime, qrScannerSheet: $qrScannerSheet, manualIPSheet: $manualIPSheet)
                }
        }
    }
}
