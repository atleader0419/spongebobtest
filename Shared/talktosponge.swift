//
//  talktosponge.swift
//  spongebobtest
//
//  Created by Chang Jack on 2021/12/6.
//

import SwiftUI

struct talktospongeView: View {
    
    @Binding var word : String
    
    @Binding var showsheet : Bool
    
    @Binding var bgcolor : Color
    
    var body: some View {
        NavigationView{
            VStack{
                Text("海綿寶寶我想對你說:")
                Text((word))
                Text("\n\n測驗結束～如果你拿了100就給一個讚 要是拿0分的話 就回去把海綿寶寶都重看！\n\n")
                Image("海綿寶寶")
                    .resizable()
                    .scaledToFill()
            }.navigationBarTitle("測驗結果如下")
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                .foregroundColor(bgcolor)
            
        }
        
          
        }
        
    }
    
struct talktospongeView_Previews: PreviewProvider {
    @State static var StrTest = "hello"
    @State static var valueTest = true
    @State static var color = Color.blue
    static var previews: some View {
        talktospongeView(word: $StrTest,showsheet: $valueTest,bgcolor: $color)
    }
}
