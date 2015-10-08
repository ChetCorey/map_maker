var mapping;

$(".pages.contact").ready

$('#map').load(
  mapping = $(function() {
    var data, map, subtitle, title;
    map = gon.maping;
    data = map.meta_data;
    title = map.title;
    subtitle = map.subtitle;


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
                min: 0
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
                color: '#999999',
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
