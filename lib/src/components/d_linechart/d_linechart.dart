import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:math';

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
    CanvasElement canvasElement = canvasRef.nativeElement;
    context = canvasElement.context2D;
    context.beginPath();
    context.moveTo(0,canvasElement.height);

    for(Map<double,double> dataPoint in data)
    {
      for(double x in dataPoint.keys)
      {
        context.lineTo(x, dataPoint[x.toString()]);
        context.arc(x, dataPoint[x], 5, 0, 2*PI, false);
      }
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
  List <Map <double,double>> data = new List<Map <double,double>>();
}
