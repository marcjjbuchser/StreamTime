//
//  ContentView.swift
//  StreamTime
//
//  Created by Marc Buchser on 2024-11-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VideoViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {

                VStack {
                    // Featured Video Section
                    if let featuredVideo = viewModel.videos.first {
                        NavigationLink(destination: VideoPlayerView(video: featuredVideo)) {
                            AsyncImage(url: URL(string: featuredVideo.highThumbnailURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 300)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        .padding()
                    }
                    
                    // Video List
                    List(viewModel.videos.dropFirst(), id: \.id) { video in
                        NavigationLink(destination: VideoPlayerView(video: video)) {
                            HStack {
                                AsyncImage(url: URL(string: video.highThumbnailURL)) { image in
                                    image.resizable()
                                         .scaledToFit()
                                         .frame(width: 150, height: 100)
                                         .cornerRadius(5)
                                } placeholder: {
                                    ProgressView()
                                }
                                Text(video.title)
                                    .font(.headline)
                                    .foregroundColor(.gray) // Ensure text is visible in dark mode
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Video Streaming")
            .onAppear {
                viewModel.fetchVideos()
            }
        }
        .accentColor(.white) // Change accent color for dark mode
    }
}

#Preview {
    ContentView()
}
