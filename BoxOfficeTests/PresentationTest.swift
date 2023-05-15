//
//  PresentationTest.swift
//  BoxOfficeTests
//
//  Created by Sunny on 2023/05/15.
//

import XCTest
@testable import BoxOffice

final class PresentationTest: XCTestCase {
    
    var sut1: PresentationProvidable!
    var sut2 = MovieInformationDispatcher()
    let daumEndpoint = DaumSearchImageEndpoint(movieName: "특송")

    override func setUpWithError() throws {
        
        try super.setUpWithError()
        sut1 = PresentationProvider()
    }

    override func tearDownWithError() throws {
        
        try super.tearDownWithError()
        sut1 = nil
    }
    
    func test_dispatcher의_fetchImage가_잘작동되는지() async {
        
        do {
            let movieImageDTO = try await sut2.fetchDaumImageDTO(daumEndpoint)
            print(movieImageDTO)
            XCTAssertNotNil(movieImageDTO)
        } catch {
            XCTFail("실패! \(error.localizedDescription)")
        }
    }
    
    func test_dispatcher의_convertImage가_잘작동되는지() async {
        
        do {
            let movieImageDTO = try await sut2.fetchDaumImageDTO(daumEndpoint)
            let movieImage = try sut2.convertImage(from: movieImageDTO)
            XCTAssertNotNil(movieImage)
        } catch {
            XCTFail("실패! \(error.localizedDescription)")
        }
    }
    
    func test_provider의_loadMoviePoster가_잘작동되는지() async {
        
        do {
            let poster = try await sut1.loadMoviePoster(movieName: "특송")
            XCTAssertNotNil(poster)
        } catch {
            XCTFail("실패! \(error.localizedDescription)")
        }
    }
}
