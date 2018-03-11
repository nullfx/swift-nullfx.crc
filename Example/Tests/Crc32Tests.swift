//
//  Crc32Tests.swift
//  nullfx.crc_Tests
//
//  Created by Steve on 3/10/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import XCTest
import nullfx_crc

class Crc32Tests: XCTestCase {
    static let TestBuffer : [UInt8] = [ 0x74, 0x65, 0x73, 0x74, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72 ];
    static let ExtendedTestBuffer : [UInt8] = [ 0x00, 0x01, 0x02, 0x74, 0x65, 0x73, 0x74, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x03, 0x04 ];
    static let Crc32Crc : UInt32 = 0xBCA3571E;
    
    
    func test_crc32Validation() {
        XCTAssertEqual( Crc32.computeChecksum(Crc8Tests.TestBuffer), Crc32Tests.Crc32Crc );
    }
    
    func test_crc32SegmentValidation() {
        XCTAssertEqual( Crc32.computeChecksum( Crc8Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc32Tests.Crc32Crc );
    }
    
    func test_crc32TestPerformance() {
        self.measure {
            var _ = Crc32.computeChecksum( Crc32Tests.TestBuffer );
        }
    }
    
}
