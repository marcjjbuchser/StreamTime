# StreamTime

StreamTime is a SwiftUI application that allows users to browse and watch videos from YouTube. The app fetches video details using the YouTube Data API and presents them in a user-friendly interface.

## Features

- Display a list of videos with thumbnails and titles.
- Navigate to a detailed video player view.
- Fetch video details using the YouTube Data API.

## Requirements

- Xcode 12.0 or later
- iOS 14.0 or later

## Setup Instructions

1. **Clone the Repository**

   ```bash
   git clone https://github.com/yourusername/StreamTime.git
   cd StreamTime
   ```

2. **Open the Project**

   Open the `StreamTime.xcodeproj` file in Xcode.

3. **Obtain a YouTube Data API Key**

   - Go to the [Google Cloud Console](https://console.cloud.google.com/).
   - Create a new project or select an existing one.
   - Enable the YouTube Data API v3 for your project.
   - Create credentials (API key) for your application.

4. **Update API Key**

   In `StreamTime/ViewModels/VideoViewModel.swift`, replace `YOUR_API_KEY` with your actual YouTube Data API key:

   ```swift
   let apiKey = "YOUR_API_KEY"
   ```

5. **Add Video IDs**

   Update the `videoIds` variable in `VideoViewModel.swift` with the actual video IDs you want to display:

   ```swift
   let videoIds = "VideoID_01,VideoID_02,VideoID_03"
   ```

6. **Run the Application**

   Select a simulator or a physical device and run the application using the play button in Xcode.

## Usage

- Upon launching the app, you will see a list of videos.
- Click on a video thumbnail to navigate to the video player view.
- The video player view displays the video title, description, and allows you to watch the video.

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [YouTube Data API](https://developers.google.com/youtube/v3)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
