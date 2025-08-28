//
//  SearchViewController.swift
//  Tabletop
//  View for users to discover & save new recipes to their collections.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
        }
    }
        
}

#Preview {
    SearchView()
}
