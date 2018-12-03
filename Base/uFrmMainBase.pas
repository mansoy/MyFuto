unit uFrmMainBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Actions, FMX.ActnList
  , FMX.Objects, Winapi.Windows, FMX.Platform.Win;

type
  TFrmMainBase = class(TForm)
    ActionList1: TActionList;
    ActOpenPage: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ActOpenPageExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitEvent();
    procedure LoadImage();
  public
    { Public declarations }
  end;

var
  FrmMainBase: TFrmMainBase;

implementation

uses uFrmTouchBase;

{$R *.fmx}

procedure TFrmMainBase.ActOpenPageExecute(Sender: TObject);
begin
  uFrmTouchBase.CreateForm(Self, Format('Tfrm%d', [10000 * (TRectangle(Sender).Tag div 10000)]), TRectangle(Sender).Tag);
end;

procedure TFrmMainBase.FormCreate(Sender: TObject);
begin
  InitEvent;
  LoadImage;
end;

procedure TFrmMainBase.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmMainBase.InitEvent;
var
	I: Integer;
begin
	//
  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[I] is TRectangle) or (Self.Components[I] is TRoundRect) then
    begin
    	{$IFNDEF DEBUG}
      TShape(Self.Components[I]).Stroke.Kind := TBrushKind.None;
      {$ENDIF}

      //打开一个新页面
      if Self.Components[I].Tag >= 1000000 then
      begin
        TShape(Self.Components[I]).OnClick := ActOpenPageExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

    end;
  	OutputDebugString(PWideChar(Format('MS - %s', [Self.Components[I].Name])));
  end;
end;

procedure TFrmMainBase.LoadImage;
var
	sImgFile: string;
begin
  try
    //tcPage.TabIndex := 0;    //这句话必须加，因为基类里边设置了TabIndex
    sImgFile := Format('%s\Image\%d.jpg', [ExtractFilePath(ParamStr(0)), 1000000]);
    if not FileExists(sImgFile) then
    begin
      MessageBox(FormToHWND(Self), PWideChar(Format('缺少图片！'#13'%s', [sImgFile])), '提示', MB_ICONWARNING);
      Exit;
    end;
    Self.Fill.Kind := TBrushKind.Bitmap;
    Self.Fill.Bitmap.Bitmap.LoadFromFile(sImgFile);
  except on E: Exception do
    OutputDebugString(PWideChar(Format('MS - [%s-LoadImage] fail [%s]', [Self.ClassName, E.Message])));
  end;
end;

end.
