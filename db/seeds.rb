# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: 'chet')

Project.create(
  study_name: 'Prison Rates in NC',
  user_id: User.first.id
)

Map.create(
  user_id: User.first.id,
  project_id: Project.first.id,
  title: 'Unemployment Per 100,000 Residents',
  subtitle: 'North Carolina 2000',
  meta_data: '[{"hc-key":"us-nc-001","value":1912},{"hc-key":"us-nc-003","value":1601},{"hc-key":"us-nc-005","value":4801},{"hc-key":"us-nc-007","value":3618},{"hc-key":"us-nc-009","value":3592},{"hc-key":"us-nc-011","value":1940},{"hc-key":"us-nc-013","value":4359},{"hc-key":"us-nc-015","value":5415},{"hc-key":"us-nc-017","value":4630},{"hc-key":"us-nc-019","value":2724},{"hc-key":"us-nc-021","value":1648},{"hc-key":"us-nc-023","value":2070},{"hc-key":"us-nc-025","value":1844},{"hc-key":"us-nc-027","value":1612},{"hc-key":"us-nc-029","value":1616},{"hc-key":"us-nc-031","value":2724},{"hc-key":"us-nc-033","value":1888},{"hc-key":"us-nc-035","value":1538},{"hc-key":"us-nc-037","value":1313},{"hc-key":"us-nc-039","value":4405},{"hc-key":"us-nc-041","value":2427},{"hc-key":"us-nc-043","value":2405},{"hc-key":"us-nc-045","value":3721},{"hc-key":"us-nc-047","value":5810},{"hc-key":"us-nc-049","value":2233},{"hc-key":"us-nc-051","value":2299},{"hc-key":"us-nc-053","value":1663},{"hc-key":"us-nc-055","value":3938},{"hc-key":"us-nc-057","value":1988},{"hc-key":"us-nc-059","value":2959},{"hc-key":"us-nc-061","value":2956},{"hc-key":"us-nc-063","value":1563},{"hc-key":"us-nc-065","value":4376},{"hc-key":"us-nc-067","value":1812},{"hc-key":"us-nc-069","value":1781},{"hc-key":"us-nc-071","value":4445},{"hc-key":"us-nc-077","value":2548},{"hc-key":"us-nc-079","value":2792},{"hc-key":"us-nc-081","value":1998},{"hc-key":"us-nc-083","value":3878},{"hc-key":"us-nc-085","value":2107},{"hc-key":"us-nc-087","value":2163},{"hc-key":"us-nc-089","value":1164},{"hc-key":"us-nc-091","value":3378},{"hc-key":"us-nc-093","value":4066},{"hc-key":"us-nc-097","value":2374},{"hc-key":"us-nc-099","value":2126},{"hc-key":"us-nc-101","value":1464},{"hc-key":"us-nc-103","value":2938},{"hc-key":"us-nc-105","value":2946},{"hc-key":"us-nc-107","value":3590},{"hc-key":"us-nc-109","value":2854},{"hc-key":"us-nc-113","value":2019},{"hc-key":"us-nc-115","value":1898},{"hc-key":"us-nc-117","value":5616},{"hc-key":"us-nc-111","value":2835},{"hc-key":"us-nc-119","value":1834},{"hc-key":"us-nc-121","value":2883},{"hc-key":"us-nc-123","value":2348},{"hc-key":"us-nc-125","value":2011},{"hc-key":"us-nc-127","value":3438},{"hc-key":"us-nc-129","value":2311},{"hc-key":"us-nc-131","value":3157},{"hc-key":"us-nc-133","value":1579},{"hc-key":"us-nc-135","value":934},{"hc-key":"us-nc-137","value":1962},{"hc-key":"us-nc-139","value":2145},{"hc-key":"us-nc-141","value":2505},{"hc-key":"us-nc-143","value":1991},{"hc-key":"us-nc-145","value":2969},{"hc-key":"us-nc-147","value":3078},{"hc-key":"us-nc-149","value":1809},{"hc-key":"us-nc-151","value":2243},{"hc-key":"us-nc-153","value":3591},{"hc-key":"us-nc-155","value":5398},{"hc-key":"us-nc-157","value":3383},{"hc-key":"us-nc-159","value":3395},{"hc-key":"us-nc-161","value":4453},{"hc-key":"us-nc-163","value":2057},{"hc-key":"us-nc-165","value":4929},{"hc-key":"us-nc-167","value":2613},{"hc-key":"us-nc-169","value":2227},{"hc-key":"us-nc-171","value":2723},{"hc-key":"us-nc-173","value":7689},{"hc-key":"us-nc-175","value":1248},{"hc-key":"us-nc-177","value":5602},{"hc-key":"us-nc-179","value":1632},{"hc-key":"us-nc-181","value":5596},{"hc-key":"us-nc-183","value":1163},{"hc-key":"us-nc-185","value":3695},{"hc-key":"us-nc-187","value":3735},{"hc-key":"us-nc-189","value":1011},{"hc-key":"us-nc-191","value":2291},{"hc-key":"us-nc-193","value":2125},{"hc-key":"us-nc-195","value":4607},{"hc-key":"us-nc-197","value":2212},{"hc-key":"us-nc-199","value":1880}]'
)
#
# MapValue.create([
#   {
#     map_id: Map.first.id,
#
# }
# ])
#
# State.create([
#     { code: 'nc'}
#   ]
# )
