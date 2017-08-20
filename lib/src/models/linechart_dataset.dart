import 'data_point.dart';
import 'dart:convert' show JSON;

class dLineChartDataset
{

  dLineChartDataset(this.dataPoints);
  dLineChartDataset.decode(Map<String, List<double>> data)
  {
    _validateChartData(data['x'], data['y']);
    for (int i = 0; i < data['x'].length; i++)
    {
      dataPoints.add(new dDataPoint(data['x'][i], data['y'][i]));
    }
  }

  dLineChartDataset.fromJson(String data)
  {
    print("decoding");
    Map<String, List<double>> dataMap = JSON.decode(data);
    _validateChartData(dataMap['x'], dataMap['y']);
    print(dataMap['x'][0]);
    for (int i = 0; i < dataMap['x'].length; i++)
    {

      dataPoints.add(new dDataPoint(dataMap['x'][i], dataMap['y'][i]));
      print(dataPoints[0].x);
      print(dataPoints[0].y);
    }
  }

  void _validateChartData(List<double> x, List<double> y)
  {
    print("validating");
    if (x == null || y == null) throw new FormatException("chart data must be a Map<String, List<double>> with 'x' and 'y as keys");
    if (x.length != y.length) throw new FormatException("chart data x and y lists must be of equal length");

    if (x.length > 1)
    {
      double xInterval = x[1] - x[0];
      for (int i = 0; i < x.length - 1; i++)
      {
        if (x[i+1] - x[i] != xInterval) throw new StateError("The interval between each x value must be constant!");
      }
    }

    print("finished validating");
  }

  List<dDataPoint> dataPoints = new List<dDataPoint>();
}