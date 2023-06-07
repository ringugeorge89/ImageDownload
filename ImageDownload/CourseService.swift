//
//  CourseServices.swift
//  ImageDownload
//
//  Created by Mohan on 07/06/23.
//

import Foundation
import SwiftUI

class CourseService: ObservableObject {
    @Published var courses :[Course] = []
    
    func getCourseList() {
        
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        
          URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
                
            }
            
            //Convert to JSON
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                
                DispatchQueue.main.async {
                    self.courses = courses
                }
            } catch {
                print(error)
            }
            
        }.resume()
        
        
    }
}
