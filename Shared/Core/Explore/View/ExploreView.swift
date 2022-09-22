//
//  ExploreView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    @State private var text = ""
    var body: some View {
        VStack {
            ScrollView{
                LazyVStack{
                    SearchBar(text: $viewModel.searchText)
                        .padding()
                    ForEach(viewModel.searchableUsers, id: \.self){ user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)

                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
