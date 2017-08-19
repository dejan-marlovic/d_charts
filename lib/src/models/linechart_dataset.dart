import 'data_point.dart';
import 'dart:convert' show JSON;

class dLineChartDataset
{

  dLineChartDataset(this.data);
  dLineChartDataset.decode(Map<String, List<double>> xValues ,Map<String, List<double>> yValues)
  {

    validateChartData(xValues, yValues);
  }

  dLineChartDataset.fromJson(String data)
  {
    Map<String, List<double>> xValues = JSON.decode(data);
    Map<String, List<double>> yValues = JSON.decode(data);

    validateChartData(xValues, yValues);
  }

  void validateChartData(Map<String, List<double>> x, Map<String, List<double>> y)
  {
    List<double> xValues = x["x"];
    List<double> yValues = y["y"];

    if (xValues == null || yValues == null) throw new FormatException("chart data must be a Map<String, List<double>> with 'x' and 'y as keys");
    if (yValues.length != xValues.length) throw new FormatException("chart data x and y lists must be of equal length");
    double xAxisInterval = xValues[1] - xValues[0];
    for (int i = 0; i < xValues.length-1; i++)
    {     
      if (xValues[i+1] - xValues[i] != xAxisInterval) throw new StateError("The interval between each x value must be constant!");
    }
  }

  List<dDataPoint> data;
}
