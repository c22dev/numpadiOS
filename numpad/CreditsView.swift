//
//  CreditsView.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
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
                Section {
                    LinkCell(imageName: "c22", url: "https://github.com/c22dev", title: "c22dev")
                    LinkCell(imageName: "diara", url: "https://github.com/diyar2137237243", title: "diyara3)")
                }
            }
            .navigationTitle("Credits")
        }
    }
}
