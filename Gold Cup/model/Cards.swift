/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Cards : Codable {
	let idFlag : String?
	let idMatch : String?
	let idPlayer : String?
	let idTeam : String?
	let minute : String?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case idFlag = "idFlag"
		case idMatch = "idMatch"
		case idPlayer = "idPlayer"
		case idTeam = "idTeam"
		case minute = "minute"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		idFlag = try values.decodeIfPresent(String.self, forKey: .idFlag)
		idMatch = try values.decodeIfPresent(String.self, forKey: .idMatch)
		idPlayer = try values.decodeIfPresent(String.self, forKey: .idPlayer)
		idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
		minute = try values.decodeIfPresent(String.self, forKey: .minute)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}