//
//  File.swift
//  numpad
//
//  Created by Constantin Clerc on 20/08/2023.
//

import Foundation
import SwiftUI
import LocalConsole

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
