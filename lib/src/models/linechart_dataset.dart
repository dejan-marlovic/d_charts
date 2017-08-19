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
    List<double>  xValues = x["x"];
    List<double>  yValues = y["y"];

    if(xValues == null || yValues == null) throw new StateError("chart data has to have format Map<String, List(double)> where string key is eather x or y!");

    if (yValues.length != xValues.length) throw new StateError("chart data has to contain same number of x and y values!");
    if (yValues.length == 0 || xValues.length == 0) throw new StateError("chart data needs to contain x and y values!");

    double xAxisInterval = xValues[1] - xValues[0];
    for (int i = 0; i< xValues.length-1; i++)
    {
      double xAxisIntervalTest = xValues[i+1] - xValues[i];
      if(xAxisIntervalTest != xAxisInterval) throw new StateError("xAxis interlvall between each x value data point needs to be constant!");
    }
  }

  List<dDataPoint> data;
}