//
//  SilverScreenTestsHelper.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 28.12.2023.
//

@testable import SilverScreen
import XCTest

class BaseXCTestCase: XCTestCase {
    var unitTestHelper: SilverScreenTestsHelper!
    
    override func setUp() {
        super.setUp()
        self.unitTestHelper = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        self.unitTestHelper = nil
    }
}

struct SilverScreenTestsHelper {
    
    /// Create mock ItemsResult<MoviesItem> model.
    ///
    /// - Parameters:
    ///   - page: mock page detail.
    ///   - results: "[MoviesItem]?"  array for specific arrays.
    ///   - numberOfItems: Count of ItemsResult.result ([MoviesItems] array).
    /// - Returns: ItemsResult<MoviesItem>
    func createMoviesItemResult(page: Int? = nil, results: [MoviesItem]? = nil, numberOfItems: Int? = nil) -> ItemsResult<MoviesItem> {
        var itemsResult: ItemsResult<MoviesItem> = .init()
        if numberOfItems == nil {
            itemsResult = .init(page: page, results: results)
        } else {
            var moviesItemArray: [MoviesItem]? = []
            for _ in 1...(numberOfItems ?? .zero) {
                moviesItemArray?.append(MoviesItem(title: "test", poster_path: "test", backdrop_path: "test", release_date: "test", vote_average: 1.0, vote_count: 1, id: 1, original_language: "test"))
            }
            itemsResult = .init(page: page, results: moviesItemArray)
        }
        return itemsResult
    }
    
    /// Create mock ItemsResult<TVShowsItem> model.
    ///
    /// - Parameters:
    ///   - page: mock page detail.
    ///   - results: "[TVShowsItem]?"  array for specific arrays.
    ///   - numberOfItems: Count of ItemsResult.result ([TVShowsItem] array)..
    /// - Returns: ItemsResult<TVShowsItem>
    func createTVShowsItemResult(page: Int? = nil, results: [TVShowsItem]? = nil, numberOfItems: Int? = nil) -> ItemsResult<TVShowsItem> {
        var itemsResult: ItemsResult<TVShowsItem> = .init()
        if numberOfItems == nil {
            itemsResult = .init(page: page, results: results)
        } else {
            var tvShowsItemArray: [TVShowsItem]? = []
            for _ in 1...(numberOfItems ?? .zero) {
                tvShowsItemArray?.append(TVShowsItem(title: "test", poster_path: "test", backdrop_path: "test", release_date: "test", vote_average: 1.0, vote_count: 1, id: 1, original_language: "test"))
            }
            itemsResult = .init(page: page, results: tvShowsItemArray)
        }
        return itemsResult
    }
    
    /// Create mock MoviesItem array.
    ///
    /// - Parameters:
    ///   - isNil: Bool value for return nil
    ///   - numberOfItems: Count of MoviesItem  array.
    /// - Returns: [MoviesItem]?
    func createMovieItemsArray(isNil: Bool = false, numberOfItems: Int = 1) -> [MoviesItem]? {
        if isNil {
            return nil
        }
        var moviesArray = [MoviesItem]()
        for _ in 1...numberOfItems {
            moviesArray.append(contentsOf: [MoviesItem(title: "test", poster_path: "test", backdrop_path: "test", release_date: "test", vote_average: 1.0, vote_count: 1, id: 1, original_language: "test")])
        }
        return moviesArray
    }
    
    /// Create mock TVShowsItem array.
    ///
    /// - Parameters:
    ///   - isNil: Bool value for return nil
    ///   - numberOfItems: Count of TVShowsItem  array.
    /// - Returns: [TVShowsItem]?
    func createTVShowItemsArray(isNil: Bool = false, numberOfItems: Int = 1) -> [TVShowsItem]? {
        if isNil {
            return nil
        }
        var tvShowsArray = [TVShowsItem]()
        for _ in 1...numberOfItems {
            tvShowsArray.append(contentsOf: [TVShowsItem(title: "test", poster_path: "test", backdrop_path: "test", release_date: "test", vote_average: 1.0, vote_count: 1, id: 1, original_language: "test")])
        }
        return tvShowsArray
    }
    
//   !!!!!!!!!!!!!!!!!!!!!! Functions below, does not used in HomeTests !!!!!!!!!!!!!!!!!!!!!!!!
    
    /// Create mock MoviesDetailResult.
    ///
    /// - Returns: MoviesDetailResult
    func createMoviesDetailResult() -> MoviesDetailResult {
        return MoviesDetailResult(title: "test", overview: "test", poster_path: "test", vote_average: 1.0, vote_count: 1, release_date: "test", original_language: "test", runtime: 1, tagline: "test", genres: [], production_countries: [])
    }
    
    /// Create mock TVShowsDetailResult.
    ///
    /// - Returns: TVShowsDetailResult
    func createTVShowsDetailResult() -> TVShowsDetailResult {
        return TVShowsDetailResult(name: "test", overview: "test", poster_path: "test", vote_average: 1.0, vote_count: 1, original_language: "test", tagline: "test", genres: [], production_countries: [])

    }
    
    /// Create mock ImagesResult.
    ///
    /// - Returns: ImagesResult
    func createImageResult() -> ImagesResult {
        return ImagesResult(backdrops: [ImageItem(file_path: "test")])
    }
    
    /// Create mock VideosModel.
    /// - Parameters:
    ///   - isEmpty: Bool value for return  empty VideosModel.results array
    ///
    /// - Returns: VideosModel
    func createVideosModel(isEmpty: Bool = false) -> VideosModel {
        return isEmpty ? VideosModel(results: []) : VideosModel(results: [VideoItem(key: "test")])
    }
    
    /// Create mock ReviewersResult.
    ///
    /// - Returns: ReviewersResult
    func createReviewersResult() -> ReviewersResult {
        return ReviewersResult(page: nil, results: nil)
    }
    
    /// Create mock FavoritesModel array.
    /// - Parameters:
    ///   - numberOfItems: Count of Favorites model array.
    ///
    /// - Returns: [FavoritesModel]
    func createFavoritesModel(numberOfItems: Int? = nil) -> [FavoritesModel] {
        var favoritesModelArray = [FavoritesModel]()
        if let numberOfItems = numberOfItems {
            for _ in 1...numberOfItems {
                favoritesModelArray.append(FavoritesModel(itemId: "test", title: "test", imageURL: "test"))
            }
        } else {
            favoritesModelArray = [FavoritesModel(itemId: "test", title: "test", imageURL: "test")]
        }
        return favoritesModelArray
    }
}
