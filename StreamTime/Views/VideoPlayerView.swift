import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var video: Video
    @State private var player: AVPlayer?

    var body: some View {
        VStack {
            Text(video.title)
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white) // Ensure title is visible

            // Custom Video Player
            VideoPlayer(player: player)
                .frame(height: 300)
                .onAppear {
                    // Load the video using AVPlayer
                    if let videoURL = URL(string: video.videoURL) {
                        player = AVPlayer(url: videoURL)
                        player?.play() // Auto-play the video
                    }
                }
                .onDisappear {
                    player?.pause() // Pause the video when leaving the view
                }

            // Description and other information
            Text(video.description)
                .font(.body)
                .padding()
                .foregroundColor(.gray) // Ensure description is visible

            // Additional information fields
            Text("Additional Info: \(video.additionalInfo)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding()
        }
        .background(Color.black) // Set background to black for better contrast
        .navigationBarTitleDisplayMode(.inline)
    }
} 