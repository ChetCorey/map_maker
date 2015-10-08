var mapping;

$(".pages.contact").ready

$('#map').load(
  mapping = $(function() {
    var data, map, subtitle, title, color_spots;
    map = gon.maping;
    data = map.meta_data;
    title = map.title;
    subtitle = map.subtitle;
    // span_val = gon.value;
    color_spots = gon.color_spots;
    console.log(color_spots[3]);


        // Initiate the chart
        $('#container').highcharts('Map', {

            title : {
                text : 'Highmaps basic demo'
            },

            subtitle : {
                text : 'Source map: <a href="http://code.highcharts.com/mapdata/countries/us/us-all-all-highres.js">United States of America, admin2, highres</a>'
            },

            mapNavigation: {
                enabled: true,
                buttonOptions: {
                    verticalAlign: 'bottom'
                }
            },

            colorAxis: {
                         dataClasses: [{
                             from: color_spots[0],
                             to: color_spots[1],
                             color: "#CCCCCC"
                         }, {
                             from: color_spots[1],
                             to: color_spots[2],
                             color: "#AAAAAA"
                         }, {
                             from: color_spots[2],
                             to: color_spots[3],
                             color: "#888888"
                         }, {
                             from: color_spots[3],
                             to: color_spots[4],
                             color: "#666666"
                         }, {
                             from: color_spots[4],
                             to: color_spots[5],
                             color: "#444444"
                         }, {
                             from: color_spots[5],
                             color: "#222222"
                         }]
                     },

            series : [{
                data : data,
                mapData: Highcharts.maps['countries/us/us-all-all-highres'],
                joinBy: 'hc-key',
                // name: 'Random data',
                states: {
                    hover: {
                        color: '#888888'
                    }
                },

                // dataLabels: {
                //     enabled: true,
                //     format: '{point.name}'
                // }
            }, {
                name: 'Separators',
                type: 'mapline',
                data: Highcharts.geojson(Highcharts.maps['countries/us/us-all-all-highres'], 'mapline'),
                color: '#333333',
                showInLegend: true,
                enableMouseTracking: false
            }]
        });
    })
  )

//
//     $('#container').highcharts('Map', {
//       title: {
//         text: title
//       },
//       subtitle: {
//         text: subtitle
//       },
//       mapNavigation: {
//         enabled: true,
//         buttonOptions: {
//           verticalAlign: 'bottom'
//         }
//       },
//       colorAxis: {
//         min: 0
//       },
//       series: [
//         {
//           data: data,
//           mapData: Highcharts.maps['countries/us/us-nc-all'],
//           joinBy: 'hc-key',
//           name: 'County',
//           states: {
//             hover: {
//               color: '#888888'
//             }
//           },
//           dataLabels: {
//             enabled: false,
//             format: '{point.name}'
//           }
//         }
//       ]
//     });
//   })
// );
