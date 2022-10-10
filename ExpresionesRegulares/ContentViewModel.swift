import Combine
import Foundation

class ContentViewModel: ObservableObject {
    
    private let didChange = PassthroughSubject<ContentViewModel, Never>()
    var strOriginal = "Lorem ipsum dolor #perritos sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. correo@duck.com Ut enim ad minim veniam, quis nostrud soy un mal correo correo@.dsjkd.com exercitation ullamco laboris nisi ut aliquip ex ea commodo #lomejor consequat. Duis aute irure dolor in prueba@correo.com.mx reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt #misuperapp mollit anim id est laborum."
    
    @Published var strHashtags = String() {
        didSet {
            didChange.send(self)
        }
    }
    @Published var strEmails = String() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        obtieneEmails()
        obtieneHashtags()
    }
    
    private func obtieneEmails() {
        let regex = try! Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+[\\.[A-Za-z]]+")
        let matches = strOriginal.matches(of: regex)
        matches.forEach { palabra in
            let email = strOriginal[palabra.range.lowerBound...palabra.range.upperBound]
            print(email.description)
            strEmails.append(email.description)
        }
    }
    
    private func obtieneHashtags() {
        let regex = try! Regex("#[a-z0-9]+")
        let matches = strOriginal.matches(of: regex)
        matches.forEach { palabra in
            let hashtag = strOriginal[palabra.range.lowerBound...palabra.range.upperBound]
            strHashtags.append(hashtag.description)
        }
    }
    
}
