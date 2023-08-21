//
//  QRScanningView.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import SwiftUI
import CodeScanner
var ip = ""
struct QRScanningView: View {
    @State var ip2: String = ""
    @Binding var qrScannerSheet: Bool
    @Binding var manualIPSheet: Bool
    var body: some View {
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
}
