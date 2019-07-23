/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Teams : Codable {
	let id : String?
	let name : String?
	let league_name : String?
	let logo_small : String?
	let logo_medium : String?
	let penalties : Int?
	let short_name : String?
	let nativ_name : String?
	let nativ_name_short : String?
	let is_placeholder_team : String?
	let conference : String?
	let playoffGroup : String?
	let total_points : String?
	let total_matchs : String?
	let nb : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case league_name = "league_name"
		case logo_small = "logo_small"
		case logo_medium = "logo_medium"
		case penalties = "penalties"
		case short_name = "short_name"
		case nativ_name = "nativ_name"
		case nativ_name_short = "nativ_name_short"
		case is_placeholder_team = "is_placeholder_team"
		case conference = "conference"
		case playoffGroup = "playoffGroup"
		case total_points = "total_points"
		case total_matchs = "total_matchs"
		case nb = "nb"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		league_name = try values.decodeIfPresent(String.self, forKey: .league_name)
		logo_small = try values.decodeIfPresent(String.self, forKey: .logo_small)
		logo_medium = try values.decodeIfPresent(String.self, forKey: .logo_medium)
		penalties = try values.decodeIfPresent(Int.self, forKey: .penalties)
		short_name = try values.decodeIfPresent(String.self, forKey: .short_name)
		nativ_name = try values.decodeIfPresent(String.self, forKey: .nativ_name)
		nativ_name_short = try values.decodeIfPresent(String.self, forKey: .nativ_name_short)
		is_placeholder_team = try values.decodeIfPresent(String.self, forKey: .is_placeholder_team)
		conference = try values.decodeIfPresent(String.self, forKey: .conference)
		playoffGroup = try values.decodeIfPresent(String.self, forKey: .playoffGroup)
		total_points = try values.decodeIfPresent(String.self, forKey: .total_points)
		total_matchs = try values.decodeIfPresent(String.self, forKey: .total_matchs)
		nb = try values.decodeIfPresent(String.self, forKey: .nb)
	}

}