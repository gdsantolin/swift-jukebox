class Artist {
    private let id: Int
    private let name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }

    func getId() -> Int {
        return id
    }

    func getName() -> String {
        return name
    }
    
}