//
//  CreditsView.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import SwiftUI

struct CreditsView: View {
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
            .navigationTitle("Credits")
        }
    }
}
