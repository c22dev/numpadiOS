//
//  File.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import Foundation
import SwiftUI


class HapticManager {
    static let instance = HapticManager()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
func sendNumToServ(intValue: Int, ipAddress: String) {
    guard let url = URL(string: "http://\(ipAddress):3000/touch") else {
           return
       }
       
       let jsonData = try? JSONSerialization.data(withJSONObject: ["intValue": intValue])
       
       var request = URLRequest(url: url)
       request.httpMethod = "POST"
       request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       request.httpBody = jsonData
       
       let task = URLSession.shared.dataTask(with: request) { data, response, error in
           if let error = error {
               print("Error: \(error)")
           } else {
               if let httpResponse = response as? HTTPURLResponse {
                   print("Server responded with status code: \(httpResponse.statusCode)")
               }
           }
       }
       task.resume()
}

// buttons by haxi0

public struct CustomButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body.weight(.medium))
            .padding(.vertical, 12)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 14.0, style: .continuous)
                            .fill(Color.accentColor))
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

public struct LinkButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.body.weight(.medium))
            .padding(.vertical, 12)
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                            .fill(Color.accentColor.opacity(0.1)))
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

public struct DangerButtonStyle: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline.weight(.bold))
            .padding(.vertical, 12)
            .foregroundColor(.red)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 12.0, style: .continuous)
                            .fill(Color.red.opacity(0.1)))
            .opacity(configuration.isPressed ? 0.4 : 1.0)
    }
}

extension Bundle {
    public var icon: UIImage? {
        if let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
            let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
            let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
            let lastIcon = iconFiles.last {
            return UIImage(named: lastIcon)
        }
        return nil
    }
}

struct LinkCell: View {
    var imageName: String
    var url: String
    var title: String
    var contribution: String
    var systemImage: Bool = false
    var circle: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            Group {
                if systemImage {
                    Image(systemName: imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    if imageName != "" {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            .cornerRadius(circle ? .infinity : 0)
            .frame(width: 24, height: 24)
            
            VStack {
                HStack {
                    Button(action: {
                        if url != "" {
                            UIApplication.shared.open(URL(string: url)!)
                        }
                    }) {
                        Text(title)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 6)
                    Spacer()
                }
                HStack {
                    Text(contribution)
                        .padding(.horizontal, 6)
                        .font(.footnote)
                    Spacer()
                }
            }
        }
        .foregroundColor(.blue)
    }
}

