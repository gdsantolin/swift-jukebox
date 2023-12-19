class Music {
    private let id: Int
    private let name: String
    private let artist: Artist
    private let duration: Int 
    private var rating: Int? // Pode ou não ter uma nota

    init(id: Int, name: String, artist: Artist, duration: Int, rating: Int? = nil) {
        self.id = id
        self.name = name
        self.artist = artist
        self.duration = duration
        self.rating = rating
    }

    func getId() -> Int {
        return id
    }

    func getName() -> String {
        return name
    }

    func getArtist() -> Artist {
        return artist
    }

    func getDuration() -> Int {
        return duration
    }

    func getRating() -> Int? {
        return rating
    }

    func printMusic() {
        var text = "\(name) - \(artist.getName()) - \(duration)s"
        if let rating = rating {
            text += " - Nota \(rating)"
        }
        print(text)
    }
    
}