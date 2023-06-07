//
//  ContentView.swift
//  ImageDownload
//
//  Created by Mohan on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var courses = CourseService()
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(courses.courses, id: \.self) { course in
                    
                    
                    HStack {
                        
                        Image("")
                            .frame(width: 120, height: 70)
                            .background(Color.gray)
                        Text(course.name)
                            .bold()
                        
                    }
                    
                }
                
            }
            .navigationTitle("Courses")
            .onAppear{
                courses.getCourseList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
