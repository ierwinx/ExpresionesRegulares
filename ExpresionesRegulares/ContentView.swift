import SwiftUI

struct ContentView: View {
    
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        
        Form {
            Section("Texto original") {
                Text(contentViewModel.strOriginal)
            }
            
            Section("Hashtags") {
                Text(contentViewModel.strHashtags)
            }
            
            Section("Emails") {
                Text(contentViewModel.strEmails)
                    .tint(.black)
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
