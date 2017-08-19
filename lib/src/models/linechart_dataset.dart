import 'data_point.dart';
import 'dart:convert' show JSON;

class dLineChartDataset
{

  dLineChartDataset(this.dataPoints);
  dLineChartDataset.decode(Map<String, List<double>> data)
  {
    List<double> xValues = data['x'];
    List<double> yValues = data['y'];
    _validateChartData(xValues, yValues);

    for (int i = 0; i < xValues.length; i++) dataPoints.add(new dDataPoint(xValues[i], yValues[i]));

  }

  dLineChartDataset.fromJson(String data)
  {
    print("decodeing");
    Map<String, List<double>> dataMap = JSON.decode(data);
    List<double> xValues = dataMap['x'];
    List<double> yValues = dataMap['y'];
    _validateChartData(dataMap['x'], dataMap['y']);

    for (int i = 0; i < xValues.length; i++) dataPoints.add(new dDataPoint(xValues[i], yValues[i]));
  }

  void _validateChartData(List<double> x, List<double> y)
  {
    List<double> xValues = x;
    List<double> yValues = y;

    if (xValues == null || yValues == null) throw new FormatException("chart data must be a Map<String, List<double>> with 'x' and 'y as keys");
    if (yValues.length != xValues.length) throw new FormatException("chart data x and y lists must be of equal length");
    
    double xAxisInterval = xValues[1] - xValues[0];    
    for (int i = 0; i < xValues.length-1; i++)
    {     
      if (xValues[i+1] - xValues[i] != xAxisInterval) throw new StateError("The interval between each x value must be constant!");
    }
  }

  List<dDataPoint> dataPoints;
}
