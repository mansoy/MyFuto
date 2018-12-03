unit uFrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects;

type
  TFrmMain = class(TForm)
    ra2010000: TRectangle;
    ra2020000: TRectangle;
    procedure FormCreate(Sender: TObject);
    procedure ra2010000Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses uFrmTouchBase, Winapi.Windows, FMX.Platform.Win;

{$R *.fmx}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  sImgFile: string;
begin
  sImgFile := ExtractFilePath(ParamStr(0)) + 'Image\1000000.jpg';
  if not FileExists(sImgFile) then
  begin
    if not FileExists(sImgFile) then
    begin
      MessageBox(FormToHWND(Self), PWideChar(Format('»±…ŸÕº∆¨£°'#13'%s', [sImgFile])), 'Ã· æ', MB_ICONWARNING);
      Exit;
    end;
  end;
  Self.Fill.Kind := TBrushKind.Bitmap;
  Self.Fill.Bitmap.Bitmap.LoadFromFile(sImgFile);
  {$IFNDEF DEBUG}
  ra2010000.Stroke.Kind := TBrushKind.None;
  ra2020000.Stroke.Kind := TBrushKind.None;
  {$ENDIF}
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmMain.ra2010000Click(Sender: TObject);
begin
  CreateForm(Self, Format('Tfrm%d', [10000 * (TRectangle(Sender).Tag div 10000)]), TRectangle(Sender).Tag)
end;

end.
