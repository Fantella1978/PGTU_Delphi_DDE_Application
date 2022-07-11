unit Unit3;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Spin, Grids, DdeMan;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DdeConv: TDdeServerConv;
    DdeSItem: TDdeServerItem;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
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
  mas:array[0..31]of real;
  StrLines:TStrings;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:byte;
  S:string[7];
begin
 if BitBtn1.Enabled=False then
  begin
   randomize;
   Memo1.Lines.Clear;
   Memo1.Lines.Add('Температура,°С');
   for i:=0 to 31 do
    begin
     mas[i]:=800+400*random;
     str(mas[i]:7:2,s);
     Memo1.Lines.add(s);
    end;
   StringGrid1.Cols[1]:=Memo1.Lines;
   DdeSItem.Lines:=Memo1.Lines;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=True;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  BitBtn2.Enabled:=False;
  BitBtn1.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  s:string[2];
  i:byte;
begin
  BitBtn1.Enabled:=False;
  Memo2.Lines.Clear;
  Memo2.Lines.Add('Зона');
  for i:=0 to 31 do
    begin
     str(i+1:2,s);
     Memo2.Lines.Add(s);
    end;
  StringGrid1.Cols[0]:=Memo2.Lines;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Timer1.Interval:=1000*SpinEdit1.Value;
end;

end.
