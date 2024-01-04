//
//  MockSearchInteractor.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 23.12.2023.
//

@testable import SilverScreen

final class MockSearchInteractor: SearchInteractorProtocol {
    
    var invokedGetSearchedMovies: Bool = false
    var invokedGetSearchedMoviesCount: Int = 0
    func getSearchedMovies(page: Int, key: String) {
        self.invokedGetSearchedMovies = true
        self.invokedGetSearchedMoviesCount += 1
    }
    
    var invokedGetSearchedTVShows: Bool = false
    var invokedGetSearchedTVShowsCount: Int = 0
    func getSearchedTVShows(page: Int, key: String) {
        self.invokedGetSearchedTVShows = true
        self.invokedGetSearchedTVShowsCount += 1
    }
}
