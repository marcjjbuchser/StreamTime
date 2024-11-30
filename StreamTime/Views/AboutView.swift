import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set background color for the entire view
            VStack(alignment: .leading, spacing: 20) {
//                Text("About StreamTime")
//                    .font(.largeTitle)
//                    .padding()

                Text("Created by: Cursor with GPT-40-Mini")
                    .font(.title2)

                Text("Version: 1.0.0") // Update this version number as needed
                    .font(.title2)

                Spacer()
            }
            .padding()
            .foregroundColor(.white) // Ensure text is visible
        }
        .navigationTitle("About")
    }
} 
