import Foundation

@Observable
class Alphabetizer {
    private var tileCount = 3
    private var vocab: Vocabulary
    
    
    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            // TODO: Check if this tile is in the correct position
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        // Delay 2 seconds
        Task { @MainActor in
            try await Task.sleep(for: .seconds(2)).self
            
            // If alphabetized, generate new tiles
            if isAlphabetized {
                startNewGame()
            }
            
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            // Display instructions
            message = .instructions
        }
    }
    
    // MARK: private implementation
    
    /// Updates 'tiles' with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
//            for index in 0..<tileCount {
//                let tile = tiles[index]
//                let word = newWords[index]
//                tile.word = word
//            }
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
        
    }
}
