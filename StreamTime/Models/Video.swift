import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let title: String
    let thumbnailURL: String
    let highThumbnailURL: String
    let description: String
    let additionalInfo: String
    
    // Computed property to generate the video URL
    var videoURL: String {
        return "https://www.youtube.com/watch?v=\(id)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "videoId"
        case title
        case thumbnailURL = "thumbnail"
        case highThumbnailURL = "highThumbnail"
        case description
        case additionalInfo
    }
} 