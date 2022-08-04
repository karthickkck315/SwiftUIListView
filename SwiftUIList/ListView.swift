//
//  ListView.swift
//  SwiftUI-List
//
//  Created by Zenitus on 04/08/22.
//

import SwiftUI

struct ListView: View {
    
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        
        NavigationView {
            List(videos, id: \.id) { video in
                NavigationLink(
                    destination: DetailView(video: video) , label: {
                        VideoCell(video: video)
                    })
            }
            .navigationTitle("Top 10 List")
        }
        
        
    }
}

struct VideoCell: View {
    var video : Video
    
    var body: some View {
        
            HStack {
                Image(video.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    .cornerRadius(5)
                    .padding(.vertical, 4)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Text(video.uploadDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
