import Foundation

class VideoViewModel: ObservableObject {
    @Published var videos: [Video] = []
    
    func fetchVideos() {
        let videoIds = "FbCA_qQSvYM,oe3Jn6FRoII,DREqX76oOLc,ftPYM2pCtsQ,WTqEwYrkiMY"
        let apiKey = "AIzaSyAJDACH6A_rzYYw5JVhx3eHakdHNQDleqE"
        let urlString = "https://www.googleapis.com/youtube/v3/videos?part=snippet&id=\(videoIds)&key=\(apiKey)"

        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let youTubeResponse = try decoder.decode(YouTubeResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.videos = youTubeResponse.items.map { item in
                            Video(
                                id: item.id,
                                title: item.snippet.title,
                                thumbnailURL: item.snippet.thumbnails.default.url,
                                highThumbnailURL: item.snippet.thumbnails.high.url,
                                description: item.snippet.description,
                                additionalInfo: "Additional info not available"
                            )
                        }
                    }
                } catch {
                    print("Error decoding videos: \(error)")
                }
            }
        }
        task.resume()
    }
}

// YouTube API response structure
struct YouTubeResponse: Codable {
    let items: [YouTubeItem]
}

struct YouTubeItem: Codable {
    let id: String
    let snippet: YouTubeSnippet
}

struct YouTubeSnippet: Codable {
    let title: String
    let description: String
    let thumbnails: YouTubeThumbnails
}

struct YouTubeThumbnails: Codable {
    let `default`: YouTubeThumbnail
    let high: YouTubeThumbnail
}

struct YouTubeThumbnail: Codable {
    let url: String
} 
