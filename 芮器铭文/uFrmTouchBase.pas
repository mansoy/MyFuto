unit uFrmTouchBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, System.Actions, FMX.ActnList
  , QJSON;

type
  TFrmTouchBase = class(TForm)
    raGoBack: TRectangle;
    raPriorPage: TRectangle;
    raNextPage: TRectangle;
    ActionList1: TActionList;
    actAction: TAction;
    actGoBack: TAction;
    actNextPage: TAction;
    actPriorPage: TAction;
    procedure actActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure actGoBackExecute(Sender: TObject);
    procedure actPriorPageExecute(Sender: TObject);
    procedure actNextPageExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
    FID: Integer;
    FImgIndex: Integer;
    FQJson: TQJson;
    FGestureX: Single;
    /// <summary>
    /// 是否使用手势翻页
    /// </summary>
    FUseGesture: Boolean;
    procedure LoadImage(AImgName: string);
    procedure InitEvent();
    procedure SetImgIndex(const Value: Integer);
  public
    { Public declarations }
    property ID: Integer read FID write FID;
    property ImgIndex: Integer read FImgIndex write SetImgIndex;
    property UseGesture: Boolean read FUseGesture write FUseGesture default True;
  end;

  /// <summary>
  /// 创建一个窗口
  /// </summary>
  /// <param name="AOwner"></param>
  /// <param name="AFormName"></param>
  /// <param name="APageIndex"></param>
  procedure CreateForm(AOwner: TComponent; AFormName: string; AID: Integer);

var
  FrmTouchBase: TFrmTouchBase;

implementation

uses Winapi.Windows, FMX.Platform.Win;

{$R *.fmx}

procedure CreateForm(AOwner: TComponent; AFormName: string; AID: Integer);
  function GetFormByName(AFormName: string): TFrmTouchBase;
  var
    i: Integer;
  begin
    Result := nil;
    for I:=0 to Screen.FormCount-1 do
    begin
      if not (Screen.Forms[I].ClassNameIs(AFormName)) then
        Continue;
      Result := TFrmTouchBase(Screen.Forms[I]);
      Break;
    end;
  end;
type
  TFormBaseClass = class of TFrmTouchBase;
var
  vForm: TFrmTouchBase;
  sClassName, s: string;
begin
  vForm := GetFormByName(AFormName);
  if vForm = nil then
  begin
    //创建
    s := Copy(Trim(AFormName), 1, 1);
    if (s <> 'T') and (s <> 't') then
      sClassName := 'T' + Trim(AFormName)
    else
      sClassName := Trim(AFormName);
    if GetClass(sClassName)<>nil then
      vForm := TFormBaseClass(FindClass(sClassName)).Create(AOwner);
  end;
  if vForm = nil then
  begin
    {$IFDEF DEBUG}
    ShowMessage('没有找到类，可能类名不对');
    {$ENDIF}
    Exit;
  end;
  //显示Form
  try
    vForm.ID := AID;
    vForm.ImgIndex := AID mod 100;
    vForm.ShowModal;
  finally
    FreeAndNil(vForm);
  end;

end;

procedure TFrmTouchBase.actActionExecute(Sender: TObject);
begin
  FID := TAction(Sender).Tag;
  ImgIndex := 0;
end;

procedure TFrmTouchBase.actGoBackExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmTouchBase.actNextPageExecute(Sender: TObject);
begin
  ImgIndex := ImgIndex + 1;
end;

procedure TFrmTouchBase.actPriorPageExecute(Sender: TObject);
begin
  ImgIndex := ImgIndex - 1;
end;

procedure TFrmTouchBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FQJson);
end;

procedure TFrmTouchBase.FormCreate(Sender: TObject);
begin
  FQJson := TQJson.Create;
  FQJson.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'cfg.dat');
  Self.Fill.Kind := TBrushKind.Bitmap;
  InitEvent;
  FUseGesture := True;
end;

procedure TFrmTouchBase.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmTouchBase.FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FGestureX := X;
end;

procedure TFrmTouchBase.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
var
  vTmp: Single;
begin
  if not UseGesture then Exit;
  vTmp := X - FGestureX;
  if Abs(vTmp) < 80 then Exit;
  if vTmp < 0 then
    actNextPage.Execute
  else
    actPriorPage.Execute;
end;

procedure TFrmTouchBase.InitEvent;
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

      //上一页
      if Self.Components[i].Name = 'raPriorPage' then
      begin
        TRectangle(Self.Components[I]).OnClick := actPriorPageExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

      //下一页
      if Self.Components[i].Name = 'raNextPage' then
      begin
        TRectangle(Self.Components[I]).OnClick := actNextPageExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

      //返回
      if Self.Components[i].Name = 'raGoBack' then
      begin
        TRectangle(Self.Components[I]).OnClick := actGoBackExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

      //打开一个新页面
      if Self.Components[I].Tag >= 1000000 then
      begin
        TShape(Self.Components[I]).OnClick := actActionExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

    end;
  	OutputDebugString(PWideChar(Format('MS - %s', [Self.Components[I].Name])));
  end;
end;

procedure TFrmTouchBase.LoadImage(AImgName: string);
var
	sImgFile: string;
begin
  try
    //tcPage.TabIndex := 0;    //这句话必须加，因为基类里边设置了TabIndex
    sImgFile := Format('%s\Image\%s', [ExtractFilePath(ParamStr(0)), AImgName]);
    if not FileExists(sImgFile) then
    begin
      MessageBox(FormToHWND(Self), PWideChar(Format('缺少图片！'#13'%s', [sImgFile])), '提示', MB_ICONWARNING);
      Exit;
    end;
    Self.Fill.Kind := TBrushKind.Bitmap;
    Self.Fill.Bitmap.Bitmap.LoadFromFile(sImgFile);
  except on E: Exception do
    //DebugInf('MS - [%s-LoadImage] fail [%s]', [Self.ClassName, E.Message]);
  end;
end;

procedure TFrmTouchBase.SetImgIndex(const Value: Integer);
var
  vJson: TQJson;
begin
  try
    vJson := FQJson.ForcePath(Format('%d.Imgs', [ID]));
    if vJson = nil then Exit;
    if vJson.Count = 0 then Exit;
    if Value < 0 then Exit;
    if Value > vJson.Count - 1 then Exit;
    FImgIndex := Value;
    LoadImage(vJson[FImgIndex].AsString);
  except

  end;
end;

end.
