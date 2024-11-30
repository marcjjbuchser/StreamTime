import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set background color for the entire view
            VStack {
                Text("Settings")
                    .font(.largeTitle)
                    .padding()

                Text("Settings... coming soon.")
                    .font(.title2)
                    .padding()

                Spacer()
            }
            .padding()
            .foregroundColor(.white) // Ensure text is visible
        }
        .navigationTitle("Settings")
    }
} 
