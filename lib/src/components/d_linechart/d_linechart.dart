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
    CanvasElement canvasElement = canvasRef.nativeElement;
    context = canvasElement.context2D;



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

    for(dDataPoint dataPoint in data.dataPoints)
    {
      context.lineTo(dataPoint.x, dataPoint.y);
      context.arc(dataPoint.x, dataPoint.y, 5, 0, 2 * PI, false);
    }
    context.fillStyle = 'gray';
    context.fill();
    context.lineWidth = 2;
    context.strokeStyle = 'gray';
    print(canvasElement.height);
    context.stroke();


    //context.arc(x, y, 5, 0, 2*PI, false);
  }

  CanvasRenderingContext2D context;
  CanvasElement canvasElement;

  @ViewChild('canvas')
  ElementRef canvasRef;

  @Input('data')
  dLineChartDataset data;
}
