//
//  ExploreView.swift
//  SwiftUITwitter (iOS)
//
//  Created by Ali Riza Reisoglu on 5.08.2022.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        VStack{
            ScrollView{
                LazyVStack{
                    ForEach(0...25, id: \.self){ _ in
                        NavigationLink {
                            ProfileView()
                        } label: {
                            UserRowView()

                        }
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
