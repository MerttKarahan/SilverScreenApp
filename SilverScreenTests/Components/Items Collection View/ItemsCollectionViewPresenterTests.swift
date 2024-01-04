//
//  ItemsCollectionViewPresenterTests,.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 29.12.2023.
//

@testable import SilverScreen
import XCTest

final class ItemsCollectionViewPresenterTests: XCTestCase {
    
    private var sutPresenter: ItemCollectionViewPresenter!
    private var unitTestHelper: SilverScreenTestsHelper!
    
    override func setUp() {
        super.setUp()
        self.unitTestHelper = .init()
        self.sutPresenter = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        self.unitTestHelper = nil
        self.sutPresenter = nil
    }
    
    func test_numberOfItems_WhenItemTypeMovie_ShouldReturnCountOfArray() {
        // Given
        sutPresenter.movieModel = unitTestHelper.createMovieItemsArray(numberOfItems: 2)
        sutPresenter.itemType = .movie
        
        // When
        let countOfArray = sutPresenter.numberOfItems
        
        // Then
        XCTAssertEqual(countOfArray, 2)
    }
    
    func test_numberOfItems_WhenItemTypeTVShow_ShouldReturnCountOfArray() {
        // Given
        sutPresenter.tvShowsModel = unitTestHelper.createTVShowItemsArray(numberOfItems: 2)
        sutPresenter.itemType = .tvShow
        
        // When
        let countOfArray = sutPresenter.numberOfItems
        
        // Then
        XCTAssertEqual(countOfArray, 2)
    }
    
    func test_numberOfItems_WhenItemTypeNil_ShouldReturnZero() {
        // Given
        sutPresenter.itemType = nil
        
        // When
        let countOfArray = sutPresenter.numberOfItems
        
        // Then
        XCTAssertEqual(countOfArray, 0)
    }
    
    func test_getCellModel_WhenItemTypeMovie_ShouldReturnMoviesItem() {
        // Given
        sutPresenter.itemType = .movie
        sutPresenter.movieModel = unitTestHelper.createMovieItemsArray(numberOfItems: 3)
        
        // When
        let item = sutPresenter.getCellModel(at: 0)
        
        // Then
        XCTAssertNotNil(item)
    }
    
    func test_getCellModel_WhenItemTypeTVShow_ShouldReturnTVShowsItem() {
        // Given
        sutPresenter.itemType = .tvShow
        sutPresenter.tvShowsModel = unitTestHelper.createTVShowItemsArray(numberOfItems: 3)
        
        // When
        let item = sutPresenter.getCellModel(at: 0)
        
        // Then
        XCTAssertNotNil(item)
    }
    
    func test_getCellModel_WhenItemTypeNil_ShouldReturnNil() {
        // Given
        sutPresenter.itemType = nil
        
        // When
        let item = sutPresenter.getCellModel(at: 1)
        
        // Then
        XCTAssertNil(item)
    }
}
