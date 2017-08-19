import 'package:angular2/angular2.dart';
import 'dart:html';

@Component(
    selector: 'd-barchart',
    styleUrls: const ['d_barchart.css'],
    templateUrl: 'd_barchart.html'
)
class dBarChartComponent implements AfterViewInit
{
  void ngAfterViewInit()
  {
    CanvasElement canvasElement = canvasRef.nativeElement;
    //context = canvasElement.context2D;
    //context.fillStyle = "red";
    //context.fillRect(0, 0, 100, 50);
    //context.save();
  }

  CanvasRenderingContext2D context;
  CanvasElement canvasElement;

  @ViewChild('canvas')
  ElementRef canvasRef;

}
