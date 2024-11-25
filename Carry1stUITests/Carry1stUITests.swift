//
//  Carry1stUITests.swift
//  Carry1stUITests
//
//  Created by Elvis Mwenda on 22/11/2024.
//

import XCTest

class Carry1stUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

        // Launch the app once for all tests to improve performance
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Optionally, add teardown code here
    }

    func testProductListLoading() throws {
        let app = XCUIApplication()

        // Wait for the product list to load
        let productList = app.collectionViews["productList"]
        XCTAssertTrue(productList.waitForExistence(timeout: 10), "The product list should appear after launching the app.")

        // Verify that at least one product is loaded
        let firstProductCell = productList.cells.element(boundBy: 0)
        XCTAssertTrue(firstProductCell.waitForExistence(timeout: 10), "At least one product should be loaded.")
    }

    func testProductSelection() throws {
        let app = XCUIApplication()

        // Wait for the product list to load
        let productList = app.collectionViews["productList"]
        XCTAssertTrue(productList.waitForExistence(timeout: 10), "The product list did not appear.")

        // Tap the first product cell
        let firstProductCell = productList.cells.element(boundBy: 0)
        XCTAssertTrue(firstProductCell.waitForExistence(timeout: 10), "The first product cell did not appear.")
        firstProductCell.tap()

        // Validate navigation to the product details screen
        let productDetails = app.collectionViews["productDetailList"]
        XCTAssertTrue(productDetails.waitForExistence(timeout: 10), "The product details view did not appear.")
    }

    func testProductDetailsDisplay() throws {
        let app = XCUIApplication()

        // Navigate to the product details screen
        let productList = app.collectionViews["productList"]
        XCTAssertTrue(productList.waitForExistence(timeout: 10), "The product list did not appear.")

        let firstProductCell = productList.cells.element(boundBy: 0)
        XCTAssertTrue(firstProductCell.waitForExistence(timeout: 10), "The first product cell did not appear.")
        firstProductCell.tap()

        // Wait for the product details screen to appear
        let productDetails = app.collectionViews["productDetailList"]
        XCTAssertTrue(productDetails.waitForExistence(timeout: 10), "The product details screen did not appear.")

        // Check the product description
        let productDescription = productDetails.staticTexts["productDescription"]
        XCTAssertTrue(productDescription.exists, "The product description should be visible.")
    }

    func testAddToCart() throws {
        let app = XCUIApplication()

        // Navigate to the product details screen
        let productList = app.collectionViews["productList"]
        XCTAssertTrue(productList.waitForExistence(timeout: 10), "The product list did not appear.")

        let firstProductCell = productList.cells.element(boundBy: 0)
        XCTAssertTrue(firstProductCell.waitForExistence(timeout: 10), "The first product cell did not appear.")
        firstProductCell.tap()

        let productDetails = app.collectionViews["productDetailList"]
        XCTAssertTrue(productDetails.waitForExistence(timeout: 10), "The product details screen did not appear.")

        // Wait for the "Add to Cart" button
        let addToCartButton = productDetails.buttons["addToCartButton"]
        XCTAssertTrue(addToCartButton.waitForExistence(timeout: 10), "The 'Add to Cart' button did not appear.")

        // Tap the Add to Cart button
        addToCartButton.tap()

        // Verify the snackbar or cart badge
        let snackbar = app.staticTexts["snackBar"]
        XCTAssertTrue(snackbar.waitForExistence(timeout: 10), "The snackbar did not appear after adding to the cart.")
    }

    func testBuyNow() throws {
        let app = XCUIApplication()

        // Navigate to the product details screen
        let productList = app.collectionViews["productList"]
        XCTAssertTrue(productList.waitForExistence(timeout: 10), "The product list did not appear.")

        let firstProductCell = productList.cells.element(boundBy: 0)
        XCTAssertTrue(firstProductCell.waitForExistence(timeout: 10), "The first product cell did not appear.")
        firstProductCell.tap()

        let productDetails = app.collectionViews["productDetailList"]
        XCTAssertTrue(productDetails.waitForExistence(timeout: 10), "The product details screen did not appear.")

        // Wait for the "Buy Now" button
        let buyNowButton = productDetails.buttons["buyNowButton"]
        XCTAssertTrue(buyNowButton.waitForExistence(timeout: 10), "The 'Buy Now' button should be visible.")

        // Tap the Buy Now button
        buyNowButton.tap()

        // Validate navigation to the purchase confirmation screen
        let purchaseConfirmation = app.staticTexts["purchaseConfirmation"]
        XCTAssertTrue(purchaseConfirmation.waitForExistence(timeout: 10), "The purchase confirmation screen should appear.")
    }
}
