//
//  Crc16Tests.swift
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

class Crc16Tests: XCTestCase {
    static let TestBuffer : [UInt8] = [ 0x74, 0x65, 0x73, 0x74, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72 ];
    static let ExtendedTestBuffer : [UInt8] = [ 0x00, 0x01, 0x02, 0x74, 0x65, 0x73, 0x74, 0x20, 0x62, 0x75, 0x66, 0x66, 0x65, 0x72, 0x03, 0x04 ];
    
    static let Crc16Crc : UInt16       = UInt16(0x132A);
    static let Crc16DnpCrc : UInt16    = UInt16(0xBAAD);
    static let Crc16CcittCrc : UInt16  = UInt16(0x23B9);
    static let Crc16CcittKCrc : UInt16 = UInt16(0xD552);
    static let Crc16Ccitt1Crc : UInt16 = UInt16(0x0BB5);
    static let Crc16CcittFCrc : UInt16 = UInt16(0xF7B6);
    
    // standard crc 16
    func test_crc16Validation() {
        XCTAssertEqual( Crc16.computeChecksum( Crc16Tests.TestBuffer ), Crc16Tests.Crc16Crc );
    }
    
    func test_crc16SegmentValidation() {
        XCTAssertEqual( Crc16.computeChecksum( Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16Crc );
    }
    
    func test_crc16TestPerformance() {
        self.measure {
            var _ = Crc16.computeChecksum( Crc8Tests.TestBuffer );
        }
    }
    
    // crc 16 dnp
    func test_crc16DnpValidation() {
        XCTAssertEqual( Crc16Dnp.computeChecksum( Crc16Tests.TestBuffer ), Crc16Tests.Crc16DnpCrc );
    }
    
    func test_crc16DnpSegmentValidation() {
        XCTAssertEqual( Crc16Dnp.computeChecksum( Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16DnpCrc );
    }
    
    func test_crc16DnpTestPerformance() {
        self.measure {
            var _ = Crc16Dnp.computeChecksum( Crc8Tests.TestBuffer );
        }
    }
    
    // crc 16 ccitt 0x0000 iv
    func test_crc16ccittValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x0000, on: Crc16Tests.TestBuffer ), Crc16Tests.Crc16CcittCrc );
    }
    
    func test_crc16ccittSegmentValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x0000, on: Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16CcittCrc );
    }
    
    func test_crc16ccittTestPerformance() {
        self.measure {
            var _ = Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x0000, on: Crc8Tests.TestBuffer );
        }
    }
    
    // crc 16 ccitt 0x1D0F iv
    func test_crc16ccitt1d0fValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x1D0F, on: Crc16Tests.TestBuffer ), Crc16Tests.Crc16Ccitt1Crc );
    }
    
    func test_crc16ccitt1d0fSegmentValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x1D0F, on: Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16Ccitt1Crc );
    }
    
    func test_crc16ccitt1d0fTestPerformance() {
        self.measure {
            var _ = Crc16Ccitt.computeChecksum( with: Crc16InitialValue.x1D0F, on: Crc8Tests.TestBuffer );
        }
    }
    
    // crc 16 ccitt 0xFFFF iv
    func test_crc16ccittffffValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.xFFFF, on: Crc16Tests.TestBuffer ), Crc16Tests.Crc16CcittFCrc );
    }
    
    func test_crc16ccittffffSegmentValidation() {
        XCTAssertEqual( Crc16Ccitt.computeChecksum( with: Crc16InitialValue.xFFFF, on: Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16CcittFCrc );
    }
    
    func test_crc16ccittffffTestPerformance() {
        self.measure {
            var _ = Crc16Ccitt.computeChecksum( with: Crc16InitialValue.xFFFF, on: Crc8Tests.TestBuffer );
        }
    }

    // crc 16 ccitt Kermit
    func test_crc16ccittKermitValidation() {
        XCTAssertEqual( Crc16CcittKermit.computeChecksum( Crc16Tests.TestBuffer ), Crc16Tests.Crc16CcittKCrc );
    }
    
    func test_crc16ccittKermitSegmentValidation() {
        XCTAssertEqual( Crc16CcittKermit.computeChecksum( Crc16Tests.ExtendedTestBuffer, startingAt: 3, length: 11), Crc16Tests.Crc16CcittKCrc );
    }
    
    func test_crc16ccittKermitTestPerformance() {
        self.measure {
            var _ = Crc16CcittKermit.computeChecksum( Crc8Tests.TestBuffer );
        }
    }
    
}
