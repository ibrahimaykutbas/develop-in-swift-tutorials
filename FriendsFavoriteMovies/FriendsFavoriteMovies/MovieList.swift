import SwiftUI
import SwiftData

struct MovieList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var movies: [Movie]
    
    @State private var newMovie: Movie?
    
    @State private var sortByTitle: Bool = true
    
    init(titleFilter: String = "") {
        let predicate = #Predicate<Movie> { movie in
            titleFilter.isEmpty || movie.title.localizedStandardContains(titleFilter)
        }
        
        _movies = Query(filter: predicate)
    }
    
    var sortedMovies: [Movie] {
        if sortByTitle {
            movies.sorted { $0.title < $1.title}
        } else {
            movies.sorted { $0.releaseDate < $1.releaseDate }
        }
    }
    
    var body: some View {
        Group {
            if !sortedMovies.isEmpty {
                List {
                    ForEach(sortedMovies) { movie in
                        NavigationLink {
                            MovieDetail(movie: movie)
                        } label: {
                            Text(movie.title)
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            } else {
                ContentUnavailableView {
                    Label("No Movies", systemImage: "film.stack")
                }
            }
        }
        .navigationTitle("Movies")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Toggle("Sort by name", isOn: $sortByTitle)
                    .padding(.horizontal)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            
            ToolbarItem {
                Button(action: addMovie) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .sheet(item: $newMovie) { movie in
            NavigationStack {
                MovieDetail(movie: movie, isNew: true)
            }
            .interactiveDismissDisabled()
        }
    }
    
    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            modelContext.insert(newItem)
            newMovie = newItem
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieList()
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("Empty List") {
    NavigationStack {
        MovieList()
            .modelContainer(for: Movie.self, inMemory: true)
    }
}

#Preview("Filtered") {
    NavigationStack {
        MovieList(titleFilter: "tr")
            .modelContainer(SampleData.shared.modelContainer)
    }
}
