unit UFMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFMain = class(TForm)
    IOrigin: TImage;
    OPD: TOpenPictureDialog;
    IBP0: TImage;
    IBP1: TImage;
    IBP2: TImage;
    IBP3: TImage;
    IBP4: TImage;
    IBP5: TImage;
    IBP6: TImage;
    IBP7: TImage;
    BBitPlanes: TButton;
    BGrayBitPlanes: TButton;
    procedure IOriginDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BBitPlanesClick(Sender: TObject);
    procedure BGrayBitPlanesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

uses
  JPEG, UImages, Math;

var
  GSI: TGreyscaleImage;

procedure JPEGtoBMP(const FileName: TFileName);
var
  JPEG: TJPEGImage;
  bmp: TBitMap;
begin
  JPEG := TJPEGImage.Create;
  try
    JPEG.CompressionQuality := 100;
    JPEG.LoadFromFile(FileName);
    bmp := TBitMap.Create;
    try
      bmp.Assign(JPEG);
      bmp.SaveTofile(ChangeFileExt(FileName, '.bmp'));
    finally
      bmp.Free
    end;
  finally
    JPEG.Free
  end;
end;

procedure TFMain.BBitPlanesClick(Sender: TObject);
var
  i, j, p: word;
  Bin: array [0 .. 7] of TBinaryImage;
begin
  for p := 0 to 7 do
    UImages.InitBinaryImg(Bin[p], GSI.N, GSI.M);

  for i := 1 to GSI.N do
    for j := 1 to GSI.M do
      for p := 0 to 7 do
        Bin[p].i[i, j] := boolean(GSI.i[i, j] and byte(round(power(2, p))));

  IBP7.Picture.Assign(SaveBinaryImgToBitMap(Bin[7]));
  IBP6.Picture.Assign(SaveBinaryImgToBitMap(Bin[6]));
  IBP5.Picture.Assign(SaveBinaryImgToBitMap(Bin[5]));
  IBP4.Picture.Assign(SaveBinaryImgToBitMap(Bin[4]));
  IBP3.Picture.Assign(SaveBinaryImgToBitMap(Bin[3]));
  IBP2.Picture.Assign(SaveBinaryImgToBitMap(Bin[2]));
  IBP1.Picture.Assign(SaveBinaryImgToBitMap(Bin[1]));
  IBP0.Picture.Assign(SaveBinaryImgToBitMap(Bin[0]));

  IBP0.Picture.SaveTofile('BP0.bmp');
  IBP1.Picture.SaveTofile('BP1.bmp');
  IBP2.Picture.SaveTofile('BP2.bmp');
  IBP3.Picture.SaveTofile('BP3.bmp');
  IBP4.Picture.SaveTofile('BP4.bmp');
  IBP5.Picture.SaveTofile('BP5.bmp');
  IBP6.Picture.SaveTofile('BP6.bmp');
  IBP7.Picture.SaveTofile('BP7.bmp');
end;

function BinToGray(BinValue: byte): byte;
begin
  BinToGray := BinValue xor (BinValue shr 1);
end;

function GrayToBin(GrayValue: byte): byte;
var
  BinValue: integer;
begin
  BinValue := 0;
  while GrayValue > 0 do
  begin
    BinValue := BinValue xor GrayValue;
    GrayValue := GrayValue shr 1;
  end;
  GrayToBin := BinValue;
end;

procedure TFMain.BGrayBitPlanesClick(Sender: TObject);
var
  i, j, p: word;
  Bin: array [0 .. 7] of TBinaryImage;
begin
  for p := 0 to 7 do
    UImages.InitBinaryImg(Bin[p], GSI.N, GSI.M);

  for i := 1 to GSI.N do
    for j := 1 to GSI.M do
      for p := 0 to 7 do
      begin
        Bin[p].i[i, j] := boolean(BinToGray(GSI.i[i, j]) and byte(round(power(2, p))));
      end;

  IBP7.Picture.Assign(SaveBinaryImgToBitMap(Bin[7]));
  IBP6.Picture.Assign(SaveBinaryImgToBitMap(Bin[6]));
  IBP5.Picture.Assign(SaveBinaryImgToBitMap(Bin[5]));
  IBP4.Picture.Assign(SaveBinaryImgToBitMap(Bin[4]));
  IBP3.Picture.Assign(SaveBinaryImgToBitMap(Bin[3]));
  IBP2.Picture.Assign(SaveBinaryImgToBitMap(Bin[2]));
  IBP1.Picture.Assign(SaveBinaryImgToBitMap(Bin[1]));
  IBP0.Picture.Assign(SaveBinaryImgToBitMap(Bin[0]));

  IBP0.Picture.SaveTofile('GBP0.bmp');
  IBP1.Picture.SaveTofile('GBP1.bmp');
  IBP2.Picture.SaveTofile('GBP2.bmp');
  IBP3.Picture.SaveTofile('GBP3.bmp');
  IBP4.Picture.SaveTofile('GBP4.bmp');
  IBP5.Picture.SaveTofile('GBP5.bmp');
  IBP6.Picture.SaveTofile('GBP6.bmp');
  IBP7.Picture.SaveTofile('GBP7.bmp');
end;

procedure TFMain.FormActivate(Sender: TObject);
begin
  IOrigin.Canvas.Rectangle(0, 0, IOrigin.Width, IOrigin.Height);
  IBP0.Canvas.Rectangle(0, 0, IBP0.Width, IBP0.Height);
  IBP1.Canvas.Rectangle(0, 0, IBP1.Width, IBP1.Height);
  IBP2.Canvas.Rectangle(0, 0, IBP2.Width, IBP2.Height);
  IBP3.Canvas.Rectangle(0, 0, IBP3.Width, IBP3.Height);
  IBP4.Canvas.Rectangle(0, 0, IBP4.Width, IBP4.Height);
  IBP5.Canvas.Rectangle(0, 0, IBP5.Width, IBP5.Height);
  IBP6.Canvas.Rectangle(0, 0, IBP6.Width, IBP6.Height);
  IBP7.Canvas.Rectangle(0, 0, IBP7.Width, IBP7.Height);
end;

procedure TFMain.IOriginDblClick(Sender: TObject);
  procedure TColorToRGB(Color: TColor; var r, g, b: byte);
  begin
    r := Color;
    g := Color shr 8;
    b := Color shr 16;
  end;

var
  BM: TBitMap;
  i, j: word;
  r, g, b: byte;

begin
  if OPD.Execute then
  begin
    BM := TBitMap.Create;
    if (pos('.JPG', AnsiUpperCase(OPD.FileName)) <> 0) or (pos('.JPEG', AnsiUpperCase(OPD.FileName)) <> 0) then
    begin
      JPEGtoBMP(OPD.FileName);
      BM.LoadFromFile(ChangeFileExt(OPD.FileName, '.bmp'));
      DeleteFile(ChangeFileExt(OPD.FileName, '.bmp'));
    end
    else
      BM.LoadFromFile(OPD.FileName);
    BM.Canvas.Brush.Style := bsClear;
    BM.Canvas.Pen.Color := clWhite;
    BM.Canvas.Pen.Width := 10;
    BM.Canvas.Rectangle(1, 1, BM.Width, BM.Height);
    for i := 0 to BM.Height - 1 do
      for j := 0 to BM.Width - 1 do
      begin
        TColorToRGB(BM.Canvas.Pixels[j, i], r, g, b);
        BM.Canvas.Pixels[j, i] := RGB(round(0.299 * r + 0.587 * g + 0.114 * b), round(0.299 * r + 0.587 * g + 0.114 * b), round(0.299 * r + 0.587 * g + 0.114 * b));
      end;
    IOrigin.Picture.Assign(BM);
    LoadGSIFromBitMap(GSI, BM);
    BM.Free;
  end;
  IOrigin.Picture.SaveTofile('Origin.bmp');
end;

end.
