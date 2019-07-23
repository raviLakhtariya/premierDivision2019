/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Scorers : Codable {
	let id_jucator : String?
	let id_team : String?
	let minute : String?
	let ownGoal : String?
	let penalityShot : String?

	enum CodingKeys: String, CodingKey {

		case id_jucator = "id_jucator"
		case id_team = "id_team"
		case minute = "minute"
		case ownGoal = "ownGoal"
		case penalityShot = "penalityShot"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id_jucator = try values.decodeIfPresent(String.self, forKey: .id_jucator)
		id_team = try values.decodeIfPresent(String.self, forKey: .id_team)
		minute = try values.decodeIfPresent(String.self, forKey: .minute)
		ownGoal = try values.decodeIfPresent(String.self, forKey: .ownGoal)
		penalityShot = try values.decodeIfPresent(String.self, forKey: .penalityShot)
	}

}