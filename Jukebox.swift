class Jukebox {
    private let musics: [Music]
    private var musicQueue: [Music]
    private var musicPrice: Double

    init(musics: [Music], musicQueue: [Music] = [], musicPrice: Double) {
        self.musics = musics
        self.musicQueue = musicQueue
        self.musicPrice = musicPrice
    }

    func chooseMusic(id: Int, user: User) {
        if let selectedMusic = musics.first(where: { $0.getId() == id }) {
            enqueueMusic(music: selectedMusic, user: user)
        } else {
            print("Música de id \(id) não encontrada na jukebox.\n")
        }
    }

    func chooseMusic(name: String, user: User) {
        if let selectedMusic = musics.first(where: { $0.getName() == name }) {
            enqueueMusic(music: selectedMusic, user: user)
        } else {
            print("Música \"\(name)\" não encontrada na jukebox.\n")
        }
    }

    // Função privada pois só é utilizada por chooseMusic
    private func enqueueMusic(music: Music, user: User) { 
        do{
            try user.deductMoney(amount: musicPrice)
            musicQueue.append(music)
            print("""
            \(user.getName()) escolheu a música \(music.getName()) por \(musicPrice). 
            Saldo restante: \(user.getMoney())  
                
            """)
        } catch JukeboxError.insufficientMoney {
            print("\(user.getName()) não tem dinheiro suficiente para escolher a música.\n")
        } catch {
            print("Erro desconhecido.")
        }
    }

    func getMusic(id: Int) -> Music? {
        return musics.first(where: { $0.getId() == id })
    }

    func getMusic(name: String) -> Music? {
        return musics.first(where: { $0.getName() == name })
    }

    func getAllMusics() -> [Music] {
        return musics
    }

    func getMusicsByArtist(id: Int) -> [Music]? {
        return musics.filter { $0.getArtist().getId() == id }
    }

    func getMusicsByArtist(name: String) -> [Music]? {
        return musics.filter { $0.getArtist().getName() == name }
    }

    func removeMusic(id: Int) {
        if let index = musicQueue.firstIndex(where: { $0.getId() == id }) {
            musicQueue.remove(at: index)
            print("Música de id \(id) removida da fila com sucesso.\n")
        } else {
            print("Música de id \(id) não encontrada na fila.\n")
        }
    }

    func removeMusic(name: String) {
        if let index = musicQueue.firstIndex(where: { $0.getName() == name }) {
            musicQueue.remove(at: index)
            print("Música \"\(name)\" removida da fila com sucesso.\n")
        } else {
            print("Música \"\(name)\" não encontrada na fila.\n")
        }
    }

    func getMostPlayedMusics() -> [(Music, Int)] {
        var musicCounts = [(Music, Int)]()
    
        for music in musics {
            musicCounts.append((music, 0))
        }

        for music in musicQueue {
            if let index = musicCounts.firstIndex(where: { $0.0.getId() == music.getId() }) {
                musicCounts[index].1 += 1
            }
        }
        
        return musicCounts.sorted { $0.1 > $1.1 }
    }

    func getMusicQueue() -> [Music] {
        return musicQueue   
    }
    
}