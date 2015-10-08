# require 'csv'
#
# if Code.count == 41787
#   puts "Code Imports Already Seeded"
#
# else
#   puts "START codes import"
#
#   datafile = Rails.root + 'db/fips_reference.csv'
#   CSV.foreach(datafile, headers: true) do |row|
#     code = Code.find_or_create_by(
#       state_code: row[0],
#       state_fips_code: row[1],
#       county_fips_code: row[2],
#       fips: row[3],
#       ansi_code: row[4],
#       gu_name: row[5],
#       gu_size: row[6]
#     )
#     puts "id: #{code.id}, name: #{code.gu_name}"
#   end
#   puts  "COMPLETE codes import"
# end
#

@user = User.create(name: Faker::Name.name)

@project = Project.create(
  title: "Project #{Project.count}",
  user_id: @user.id
)

@study = Study.create(
  title: "Study #{Study.count}",
  project_id: @project.id
)

@map = Map.create(
  user_id: @user.id,
  study_id: @project.id,
  country: "us",
  state: "nc",
  title: "Map #{Map.count} #{@user.name}",
  subtitle: 'North Carolina 2000',
  # meta_data: '[{"hc-key":"us-nc-001","value":1912},{"hc-key":"us-nc-003","value":1601},{"hc-key":"us-nc-005","value":4801},{"hc-key":"us-nc-007","value":3618},{"hc-key":"us-nc-009","value":3592},{"hc-key":"us-nc-011","value":1940},{"hc-key":"us-nc-013","value":4359},{"hc-key":"us-nc-015","value":5415},{"hc-key":"us-nc-017","value":4630},{"hc-key":"us-nc-019","value":2724},{"hc-key":"us-nc-021","value":1648},{"hc-key":"us-nc-023","value":2070},{"hc-key":"us-nc-025","value":1844},{"hc-key":"us-nc-027","value":1612},{"hc-key":"us-nc-029","value":1616},{"hc-key":"us-nc-031","value":2724},{"hc-key":"us-nc-033","value":1888},{"hc-key":"us-nc-035","value":1538},{"hc-key":"us-nc-037","value":1313},{"hc-key":"us-nc-039","value":4405},{"hc-key":"us-nc-041","value":2427},{"hc-key":"us-nc-043","value":2405},{"hc-key":"us-nc-045","value":3721},{"hc-key":"us-nc-047","value":5810},{"hc-key":"us-nc-049","value":2233},{"hc-key":"us-nc-051","value":2299},{"hc-key":"us-nc-053","value":1663},{"hc-key":"us-nc-055","value":3938},{"hc-key":"us-nc-057","value":1988},{"hc-key":"us-nc-059","value":2959},{"hc-key":"us-nc-061","value":2956},{"hc-key":"us-nc-063","value":1563},{"hc-key":"us-nc-065","value":4376},{"hc-key":"us-nc-067","value":1812},{"hc-key":"us-nc-069","value":1781},{"hc-key":"us-nc-071","value":4445},{"hc-key":"us-nc-077","value":2548},{"hc-key":"us-nc-079","value":2792},{"hc-key":"us-nc-081","value":1998},{"hc-key":"us-nc-083","value":3878},{"hc-key":"us-nc-085","value":2107},{"hc-key":"us-nc-087","value":2163},{"hc-key":"us-nc-089","value":1164},{"hc-key":"us-nc-091","value":3378},{"hc-key":"us-nc-093","value":4066},{"hc-key":"us-nc-097","value":2374},{"hc-key":"us-nc-099","value":2126},{"hc-key":"us-nc-101","value":1464},{"hc-key":"us-nc-103","value":2938},{"hc-key":"us-nc-105","value":2946},{"hc-key":"us-nc-107","value":3590},{"hc-key":"us-nc-109","value":2854},{"hc-key":"us-nc-113","value":2019},{"hc-key":"us-nc-115","value":1898},{"hc-key":"us-nc-117","value":5616},{"hc-key":"us-nc-111","value":2835},{"hc-key":"us-nc-119","value":1834},{"hc-key":"us-nc-121","value":2883},{"hc-key":"us-nc-123","value":2348},{"hc-key":"us-nc-125","value":2011},{"hc-key":"us-nc-127","value":3438},{"hc-key":"us-nc-129","value":2311},{"hc-key":"us-nc-131","value":3157},{"hc-key":"us-nc-133","value":1579},{"hc-key":"us-nc-135","value":934},{"hc-key":"us-nc-137","value":1962},{"hc-key":"us-nc-139","value":2145},{"hc-key":"us-nc-141","value":2505},{"hc-key":"us-nc-143","value":1991},{"hc-key":"us-nc-145","value":2969},{"hc-key":"us-nc-147","value":3078},{"hc-key":"us-nc-149","value":1809},{"hc-key":"us-nc-151","value":2243},{"hc-key":"us-nc-153","value":3591},{"hc-key":"us-nc-155","value":5398},{"hc-key":"us-nc-157","value":3383},{"hc-key":"us-nc-159","value":3395},{"hc-key":"us-nc-161","value":4453},{"hc-key":"us-nc-163","value":2057},{"hc-key":"us-nc-165","value":4929},{"hc-key":"us-nc-167","value":2613},{"hc-key":"us-nc-169","value":2227},{"hc-key":"us-nc-171","value":2723},{"hc-key":"us-nc-173","value":7689},{"hc-key":"us-nc-175","value":1248},{"hc-key":"us-nc-177","value":5602},{"hc-key":"us-nc-179","value":1632},{"hc-key":"us-nc-181","value":5596},{"hc-key":"us-nc-183","value":1163},{"hc-key":"us-nc-185","value":3695},{"hc-key":"us-nc-187","value":3735},{"hc-key":"us-nc-189","value":1011},{"hc-key":"us-nc-191","value":2291},{"hc-key":"us-nc-193","value":2125},{"hc-key":"us-nc-195","value":4607},{"hc-key":"us-nc-197","value":2212},{"hc-key":"us-nc-199","value":1880}]'
  meta_data: '[{"fips":"37001","value":116330},{"fips":"37003","value":30427},{"fips":"37005","value":9290},{"fips":"37007","value":20969},{"fips":"37009","value":21991},{"fips":"37011","value":15945},{"fips":"37013","value":37773},{"fips":"37015","value":15398},{"fips":"37017","value":26602},{"fips":"37019","value":85449},{"fips":"37021","value":187479},{"fips":"37023","value":72646},{"fips":"37025","value":128503},{"fips":"37027","value":64294},{"fips":"37029","value":8219},{"fips":"37031","value":55737},{"fips":"37033","value":19895},{"fips":"37035","value":124173},{"fips":"37037","value":49617},{"fips":"37039","value":23158},{"fips":"37041","value":11840},{"fips":"37043","value":9068},{"fips":"37045","value":78449},{"fips":"37047","value":43676},{"fips":"37049","value":75537},{"fips":"37051","value":240968},{"fips":"37053","value":21000},{"fips":"37055","value":31479},{"fips":"37057","value":128227},{"fips":"37059","value":33516},{"fips":"37061","value":42760},{"fips":"37063","value":202727},{"fips":"37065","value":40136},{"fips":"37067","value":273681},{"fips":"37069","value":46707},{"fips":"37071","value":158889},{"fips":"37077","value":46263},{"fips":"37079","value":16883},{"fips":"37081","value":373685},{"fips":"37083","value":44399},{"fips":"37085","value":87097},{"fips":"37087","value":48803},{"fips":"37089","value":86470},{"fips":"37091","value":19776},{"fips":"37093","value":34679},{"fips":"37097","value":120909},{"fips":"37099","value":31578},{"fips":"37101","value":128402},{"fips":"37103","value":8441},{"fips":"37105","value":45193},{"fips":"37107","value":45802},{"fips":"37109","value":59821},{"fips":"37113","value":29489},{"fips":"37115","value":17682},{"fips":"37117","value":19006},{"fips":"37111","value":35851},{"fips":"37119","value":694616},{"fips":"37121","value":13327},{"fips":"37123","value":22371},{"fips":"37125","value":71304},{"fips":"37127","value":75676},{"fips":"37129","value":164890},{"fips":"37131","value":17518},{"fips":"37133","value":124880},{"fips":"37135","value":107473},{"fips":"37137","value":11290},{"fips":"37139","value":33698},{"fips":"37141","value":42768},{"fips":"37143","value":10523},{"fips":"37145","value":31193},{"fips":"37147","value":121767},{"fips":"37149","value":16681},{"fips":"37151","value":114713},{"fips":"37153","value":36913},{"fips":"37155","value":101280},{"fips":"37157","value":74532},{"fips":"37159","value":110030},{"fips":"37161","value":51783},{"fips":"37163","value":52856},{"fips":"37165","value":29318},{"fips":"37167","value":48080},{"fips":"37169","value":38519},{"fips":"37171","value":60632},{"fips":"37173","value":11366},{"fips":"37175","value":26200},{"fips":"37177","value":3594},{"fips":"37179","value":142701},{"fips":"37181","value":34288},{"fips":"37183","value":676385},{"fips":"37185","value":17184},{"fips":"37187","value":10431},{"fips":"37189","value":38299},{"fips":"37191","value":92387},{"fips":"37193","value":54864},{"fips":"37195","value":62401},{"fips":"37197","value":31105},{"fips":"37199","value":15551}]'
)

Record.create([
  { fips: "37001", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37003", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37005", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37007", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37009", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37011", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37013", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37015", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37017", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37019", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37021", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37023", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37025", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37027", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37029", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37031", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37033", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37035", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37037", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37039", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37041", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37043", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37045", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37047", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37049", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37051", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37053", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37055", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37057", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37059", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37061", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37063", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37065", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37067", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37069", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37071", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37073", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37075", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37077", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37079", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37081", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37083", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37085", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37087", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37089", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37091", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37093", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37095", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37097", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37099", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37101", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37103", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37105", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37107", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37109", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37111", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37113", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37115", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37117", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37119", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37121", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37123", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37125", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37127", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37129", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37131", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37133", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37135", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37137", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37139", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37141", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37143", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37145", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37147", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37149", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37151", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37153", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37155", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37157", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37159", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37161", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37163", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37165", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37167", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37169", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37171", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37173", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37175", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37177", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37179", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37181", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37183", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37185", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37187", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37189", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37191", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37193", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37195", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37197", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
  { fips: "37199", value: rand(10000..150000).to_s, study_id: @study.id, user_id: @user.id, map_id: @map.id },
])
