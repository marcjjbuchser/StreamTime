import SwiftUI

struct DrawerView: View {
    @ObservedObject var viewModel: VideoViewModel

    var body: some View {
        HStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Add some padding to push items down
                    Spacer().frame(height: 20) // Adjust height as needed

                    // Menu items
                    if let firstVideo = viewModel.videos.first {
                        NavigationLink(destination: VideoPlayerView(video: firstVideo)) {
                            Text("Hubs")
                                .font(.title2) // Increased font size
                                .padding()
                        }
                    }

                    NavigationLink(destination: SettingsView()) {
                        Text("Settings")
                            .font(.title2) // Increased font size
                            .padding()
                    }
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                            .font(.title2) // Increased font size
                            .padding()
                    }

                    Spacer()
                }
                .frame(maxWidth: 300)
                .background(Color.gray) // .opacity(0.9))
                .edgesIgnoringSafeArea(.top)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
} 
