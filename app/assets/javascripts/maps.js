var mapping;

$(".pages.contact").ready

$('#map').load(
  mapping = $(function() {
    var data, map, subtitle, title, lines;

    map = gon.maping;
    data = map.meta_data;
    title = map.title;
    subtitle = map.subtitle;

    // MapLines
    lines = Highcharts.geojson(Highcharts.maps['countries/us/us-all-all'], 'mapline');

    // Initiate the chart
    $('#container').highcharts('Map', {
      title: {
        text: title
      },

      subtitle: {
        text: subtitle
      },

      mapNavigation: {
        enabled: true,
        buttonOptions: {
          verticalAlign: 'bottom'
        }
      },

      plotOptions: {
        map: {
          nullColor: 'white'
        }
      },

      colorAxis: {
        minColor: '#F0F0F0',
        maxColor: '#000000',
        gridLineWidth: 2,
        gridLineColor: 'white'
      },

      series: [{
        data: data,
        type: 'map',
        borderWidth: '9',
        mapData: Highcharts.maps['countries/us/us-all-all'],
        joinBy: 'hc-key',
        borderColor: 'clear',
        states: {
          normal: {
            animation: true
          },
          hover: {
            color: '#888888'
            }
          }
        },
        {
          data: lines,
          type: 'mapline',
          name: 'Separators',
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
