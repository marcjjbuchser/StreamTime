//
//  ContentView.swift
//  StreamTime
//
//  Created by Marc Buchser on 2024-11-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = VideoViewModel()
    @State private var isDrawerOpen = false // State variable to control drawer visibility
    @State private var isLoading = true // State variable to control loading screen visibility

    var body: some View {
        NavigationView {
            ZStack {
                // Main content
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
                .navigationTitle(isDrawerOpen ? "" : "StreamTime") // Hide title when drawer is open
                .onAppear {
                    viewModel.fetchVideos()
                }
                
                // Drawer
                if isDrawerOpen {
                    DrawerView(viewModel: viewModel) // Pass the viewModel to DrawerView
                        .transition(.move(edge: .leading))
                        .onTapGesture {
                            withAnimation {
                                isDrawerOpen.toggle()
                            }
                        }
                        .zIndex(1) // Ensure drawer is on top
                }

                // Loading Screen
                if isLoading {
                    Color.white
                        .overlay(
                            Text("Loading...")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        )
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Simulate loading time
                                isLoading = false
                            }
                        }
                }
            }
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    isDrawerOpen.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3") // Hamburger icon
                    .font(.title)
            })
        }
        .accentColor(.white) // Change accent color for dark mode
    }
}

#Preview {
    ContentView()
}
