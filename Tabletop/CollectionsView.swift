//
//  CollectionsViewController.swift
//  Tabletop
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct CollectionsView: View {
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
