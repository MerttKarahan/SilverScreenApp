//
//  ItemsTableViewPresenterTests.swift
//  SilverScreenTests
//
//  Created by Karahan, Mert on 28.12.2023.
//

@testable import SilverScreen
import XCTest

final class ItemsTableViewPresenterTests: XCTestCase {
    
    private var sutItemsTableViewPresenter: ItemsTableViewPresenter!
    
    override func setUp() {
        super.setUp()
        self.sutItemsTableViewPresenter = .init()
    }
    
    override func tearDown() {
        super.tearDown()
        self.sutItemsTableViewPresenter = nil
    }
    
    func createItemsArray(isNil: Bool) {
        sutItemsTableViewPresenter.items = isNil ? nil : [ReviewItem(author: "test", content: "test", created_at: "test", author_details: AuthorDetails(rating: 1.0))]
    }
    
    func test_numberOfItems_WhenItemsExist_ShouldNotReturnCountOfArray() {
        // Given
        self.createItemsArray(isNil: false)
        
        // When
        let numberOfItems = sutItemsTableViewPresenter.numberOfItems
        
        // Then
        XCTAssertEqual(numberOfItems, 1)
    }
    
    func test_numberOfItems_WhenItemsNil_ShouldNotReturnZero() {
        // Given
        self.createItemsArray(isNil: true)
        
        // When
        let numberOfItems = sutItemsTableViewPresenter.numberOfItems
        
        // Then
        XCTAssertEqual(numberOfItems, 0)
    }
    
    func test_getCellModel_WhenItemsExist_ShouldNotReturnNil() {
        // Given
        self.createItemsArray(isNil: false)
        
        // When
        let item = sutItemsTableViewPresenter.getCellModel(at: 0)
        
        // Then
        XCTAssertNotNil(item)
    }
    
    func test_getCellModel_WhenItemsNil_ShouldReturnNil() {
        // Given
        self.createItemsArray(isNil: true)
        
        // When
        let item = sutItemsTableViewPresenter.getCellModel(at: 0)
        
        // Then
        XCTAssertNil(item)
    }
}
