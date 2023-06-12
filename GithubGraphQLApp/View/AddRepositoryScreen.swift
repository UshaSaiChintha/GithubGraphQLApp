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
    @StateObject private var addRepositoryViewModel = AddRepositoryViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: $addRepositoryViewModel.name)
            TextField("Description", text: $addRepositoryViewModel.description)
            
            Picker("Select", selection: $addRepositoryViewModel.visibility, content: {
                Text("Public").tag(RepositoryVisibility.public)
                Text("Private").tag(RepositoryVisibility.private)
            }).pickerStyle(SegmentedPickerStyle())
            
            
            HStack {
                Spacer()
                Button("Save") {
                    addRepositoryViewModel.saveRepository {
                        presentationMode.wrappedValue.dismiss()
                    }
                
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
