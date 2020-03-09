//
//  InfoView.swift
//  ColorPalette
//
//  Created by Michael Borisov on 09.03.2020.
//  Copyright © 2020 Michael Borisov. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Button("Dismiss") {
                self.showModal.toggle()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(showModal: .constant(true))
    }
}
