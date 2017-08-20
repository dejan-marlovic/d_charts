import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:math';
import 'package:d_charts/src/models/linechart_dataset.dart';
import 'package:d_charts/src/models/data_point.dart';

@Component(
    selector: 'd-linechart',
    styleUrls: const ['d_linechart.css'],
    templateUrl: 'd_linechart.html'
)
class dLineChartComponent implements AfterViewInit, OnChanges
{
  void ngAfterViewInit()
  {
    print("intilizing");
    //context.fillRect(0, 0, 100, 50);
    //context.fillStyle = "red";
    //context.fillRect(0, 0, 100, 50);
    //context.save();

  }

   ngOnChanges(Map<String, SimpleChange> changes)
  {
    print("drawing..");
    CanvasElement canvasElement = canvasRef.nativeElement;
    context = canvasElement.context2D;
    context.beginPath();
    context.moveTo(0,canvasElement.height);
    context.fillStyle = 'gray';
    context.strokeStyle = 'gray';

    context.lineWidth = 7;

    for(dDataPoint dataPoint in data.dataPoints)
    {
      context.lineTo(dataPoint.x, dataPoint.y);
      context.arc(dataPoint.x, dataPoint.y, 7, 0, 2 * PI, false);
      context.moveTo(dataPoint.x,dataPoint.y);
    }



    print(canvasElement.height);
    context.stroke();
    context.save();


    //context.arc(x, y, 5, 0, 2*PI, false);
  }

  CanvasRenderingContext2D context;
  CanvasElement canvasElement;

  @ViewChild('canvas')
  ElementRef canvasRef;

  @Input('data')
  dLineChartDataset data;
}
