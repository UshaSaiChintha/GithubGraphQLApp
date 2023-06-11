//
//  AddRepositoryScreen.swift
//  GithubGraphQLApp
//
//  Created by Usha Sai Chintha on 10/06/23.
//

import Foundation
import SwiftUI


struct AddRepositoryScreen: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var visibility: String = "public"
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Description", text: $description)
            
            Picker("Select", selection: $visibility, content: {
                Text("Public").tag("public")
                Text("Private").tag("private")
            }).pickerStyle(SegmentedPickerStyle())
            
            
            HStack {
                Spacer()
                Button("Save") {
                    
                
                }
                Spacer()
            }
        }
        .navigationTitle("Add Repository")
        .embedInNavigationView()
    }
}

struct AddRepositoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddRepositoryScreen()
    }
}