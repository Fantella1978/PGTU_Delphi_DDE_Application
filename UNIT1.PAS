unit Unit1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Buttons, DdeMan;

type
  TForm1 = class(TForm)
    DdeClientConv1: TDdeClientConv;
    DdeClientItem1: TDdeClientItem;
    Memo1: TMemo;
    Label4: TLabel;
    Shape1: TShape;
    Bevel2: TBevel;
    Label1: TLabel;
    Shape2: TShape;
    Label2: TLabel;
    Shape3: TShape;
    Label3: TLabel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    procedure DdeClientItem1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
var
  mas:array[0..31] of real;
  m:real;

procedure TForm1.DdeClientItem1Change(Sender: TObject);
var
  x1,y1,x2,y2,xn,yn,c:integer;
  i:byte;
  dugol,ugol,sum:real;
  s:string[2];
begin
 Memo1.Lines:=DdeClientItem1.Lines;
 dugol:=360/32/180*pi;
 sum:=0;
 for i:=0 to 31 do
  begin
    val(Memo1.Lines[i+1],mas[i],c);
    sum:=sum+mas[i];
  end;
 m:=sum/32;
 for i:=0 to 31 do
  begin
    ugol:=i*dugol;
    x1:=115-round(80*cos(ugol));
    y1:=110-round(80*sin(ugol));
    x2:=115-round(80*cos(ugol+dugol));
    y2:=110-round(80*sin(ugol+dugol));
    xn:=109-round(96*cos(ugol+dugol/2));
    yn:=105-round(96*sin(ugol+dugol/2));
    if mas[i]<=m then
      Canvas.Brush.Color := clGray
     else
      Canvas.Brush.Color := clWhite;
    Canvas.Pen.Color := clBlack;
    Canvas.Polygon([Point(x1,y1),Point(x2, y2),
    Point(115,110)]);
    str(i+1,s);
    Canvas.Brush.Color := clAppWorkSpace;
    Canvas.TextOut(xn,yn,s);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DdeClientItem1.DdeItem:='DdeSItem';
end;

end.
