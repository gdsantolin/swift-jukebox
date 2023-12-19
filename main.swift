enum JukeboxError : Error {
  case insufficientMoney
}


// Função auxiliar para imprimir as listas de músicas
func printMusicArray(_ musics: [Music]) {
    for music in musics {
        music.printMusic()
    }
}

func showMenu(jukebox: Jukebox, user: User) {
    print("""
          
          -- Bem-vindo à Jukebox, \(user.getName())! --
          
          """)
    print("1. Escolher música pelo ID")
    print("2. Escolher música pelo nome")
    print("3. Consultar música pelo ID")
    print("4. Consultar música pelo nome")
    print("5. Mostrar todas as músicas disponíveis")
    print("6. Mostrar músicas de um artista pelo ID")
    print("7. Mostrar músicas de um artista pelo nome")
    print("8. Retirar uma música da fila pelo ID")
    print("9. Retirar uma música da fila pelo nome")
    print("10. Ver fila de músicas")
    print("11. Ver músicas mais escolhidas")
    print("12. Sair\n")
    
    // Lê a entrada do usuário
    if let choice = readLine(), let option = Int(choice) {
        
        switch option {
            case 1:
                print("\nDigite o ID da música:\n")
                if let musicId = readLine(), let id = Int(musicId) {
                    jukebox.chooseMusic(id: id, user: user)
                } else {
                    print("\nEntrada inválida.\n")
                }
                
            case 2:
                print("\nDigite o nome da música:")
                if let name = readLine() {
                    jukebox.chooseMusic(name: name, user: user)
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 3:
                print("\nDigite o ID da música:")
                if let musicId = readLine(), let id = Int(musicId) {
                    if let music = jukebox.getMusic(id: id) {
                      music.printMusic()
                    } else {
                      print("\nMúsica de id \(id) não encontrada na jukebox.\n")
                    }
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 4:
                print("\nDigite o nome da música:")
                if let name = readLine() {
                    if let music = jukebox.getMusic(name: name) {
                      music.printMusic()
                    } else {
                      print("\nMúsica \"\(name)\" não encontrada na jukebox.\n")
                    }
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 5:
                print("\nTodas as músicas disponíveis:\n")
                printMusicArray(jukebox.getAllMusics())
          
            case 6:
                print("\nDigite o ID do artista:")
                if let artistId = readLine(), let id = Int(artistId) {
                    if let musics = jukebox.getMusicsByArtist(id: id) {
                        printMusicArray(musics)
                    } else {
                        print("\nArtista não encontrado ou não há músicas para mostrar.\n")
                    }
                } else {
                    print("\nEntrada inválida.\n")
                }
                
            case 7:
                print("\nDigite o nome do artista:")
                if let name = readLine() {
                    if let musics = jukebox.getMusicsByArtist(name: name) {
                        printMusicArray(musics)
                    } else {
                        print("\nArtista não encontrado ou não há músicas para mostrar.\n")
                    }
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 8:
                print("\nDigite o ID da música:")
                if let musicId = readLine(), let id = Int(musicId) {
                    jukebox.removeMusic(id: id)
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 9:
                print("\nDigite o nome da música:")
                if let name = readLine() {
                    jukebox.removeMusic(name: name)
                } else {
                    print("\nEntrada inválida.\n")
                }
          
            case 10:
                print("\nFila de músicas:\n")
                print(jukebox.getMusicQueue().map { $0.getName() })
          
            case 11:
                print("\nMúsicas mais escolhidas:\n")
                for (music, count) in jukebox.getMostPlayedMusics() {
                    print("\(music.getName()) - \(count)x")
                }
          
            case 12:
                print("\nSaindo...\n")
                run = false
          
            default:
                print("\nOpção inválida.\n")
        }
    } else {
        print("Opção inválida.")
    }
}  

// Criando artistas
let a1 = Artist(id: 1, name: "Pink Floyd")
let a2 = Artist(id: 2, name: "Metallica")

// Criando músicas
let m1 = Music(id: 1, name: "Dogs", artist: a1, duration: 180, rating: 4)
let m2 = Music(id: 2, name: "Comfortably Numb", artist: a1, duration: 200, rating: 5)
let m3 = Music(id: 3, name: "Time", artist: a1, duration: 220, rating: nil)
let m4 = Music(id: 4, name: "One", artist: a2, duration: 240, rating: 3)
let m5 = Music(id: 5, name: "Enter Sandman", artist: a2, duration: 260)

// Criando uma lista de músicas disponíveis
let musics = [m1, m2, m3, m4, m5]

// Criando uma jukebox com músicas disponíveis e preço
let jukebox = Jukebox(musics: musics, musicPrice: 1.99)

// Criando um usuário
let u1 = User(id: 1, name: "Gustavo", money: 10.0, age: 21)

// Exibindo o menu até que o usuário escolha sair
var run = true
while run {
    showMenu(jukebox: jukebox, user: u1)
}