//
//  PlateViewController.swift
//  Tabletop
//  View for users to upload new posts to their feed.
//
//  Created by Karen Sabile on 7/22/25.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        ZStack {
            Image("wood")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            Rectangle()
                .fill(Color(red: 0.55, green: 0.11, blue: 0.11))
                .frame(maxWidth: .infinity)
                .frame(height: 200)
            
            Button(action: {
                plateDish() })
            {
                ZStack {
                    Image("plate")
                        .resizable()
                        .frame(width: 350, height: 350, alignment: .center)
                    
                    Text("tap to plate \n a dish")
                        .font(Font.custom("OPTIGleam-Light", size: 25))
                        .bold()
                }
            }
        }
    }
    
    func plateDish() {
        
    }
}

#Preview {
    SearchView()
}
