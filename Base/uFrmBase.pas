unit uFrmBase;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs
  , FMX.Objects, System.Actions, FMX.ActnList
  , Winapi.Windows, FMX.Platform.Win
  , QJSON;

type
  TFrmBase = class(TForm)
    ActionList1: TActionList;
    actPriorPage: TAction;
    actNextPage: TAction;
    actMainPage: TAction;
    ActOpenPage: TAction;
    actGoBack: TAction;
    raImage: TRectangle;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure ActOpenPageExecute(Sender: TObject);
    procedure ActGoBackExecute(Sender: TObject);
    procedure actPriorPageExecute(Sender: TObject);
    procedure actNextPageExecute(Sender: TObject);
    procedure actMainPageExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure raImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure raImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure FormDestroy(Sender: TObject);
  private
    FImgIndex: Integer;
    FID: Integer;
    FGestureX: Single;
    /// <summary>
    /// 是否使用手势翻页
    /// </summary>
    FUseGesture: Boolean;
    FCfg: TQJson;
    { Private declarations }
    procedure InitEvent;
    procedure LoadImage(AImgName: string);
    function LoadCfg: TQJson;
  protected
    procedure SetImgIndex(const Value: Integer); virtual;
    property UseGesture: Boolean read FUseGesture write FUseGesture default True;
    property Cfg: TQJson read FCfg;
  public
    { Public declarations }
    property ID: Integer read FID write FID;
    property ImgIndex: Integer read FImgIndex write SetImgIndex;
  end;

  procedure MsCloseOtherForms(AClassName: string = '');

  /// <summary>
  /// 关闭类名为AClassName的窗口
  /// </summary>
  /// <param name="AClassName">窗口类名</param>
  procedure MsCloseForm(AClassName: string = '');

  /// <summary>
  /// 创建一个窗口
  /// </summary>
  procedure MsCreateForm(AOwner: TComponent; AFormName: string; AID: Integer);

var
  FrmBase: TFrmBase;

implementation

uses uComm;

{$R *.fmx}

procedure MsCloseOtherForms(AClassName: string = '');
var
  i: Integer;
  vForm: TForm;
begin
  for I:=0 to Screen.FormCount-1 do
  begin
    vForm := TForm(Screen.Forms[I]);
    //if vForm.ID = 1000000 then
    if UpperCase(vForm.ClassName) = UpperCase('TMainForm') then
      Continue;
    if (AClassName <> '') then
    begin
      if not (vForm.ClassNameIs(AClassName)) then Continue;
    end;
    vForm.Close;
    //FreeAndNil(vForm);
    //Break;
  end;
end;

procedure MsCloseForm(AClassName: string = '');
var
  i: Integer;
  vForm: TForm;
begin
	if AClassName = '' then
  begin
    Exit;
  end;
  for I:=0 to Screen.FormCount-1 do
  begin
    vForm := TForm(Screen.Forms[I]);
		if not (vForm.ClassNameIs(AClassName)) then Continue;
    vForm.Close;
    //FreeAndNil(vForm);
    Break;
  end;
end;

procedure MsCreateForm(AOwner: TComponent; AFormName: string; AID: Integer);
  function GetFormByName(AFormName: string): TFrmBase;
  var
    i: Integer;
  begin
    Result := nil;
    for I:=0 to Screen.FormCount-1 do
    begin
      if not (Screen.Forms[I].ClassNameIs(AFormName)) then
        Continue;
      Result := TFrmBase(Screen.Forms[I]);
      Break;
    end;
  end;
type
  TFrmBaseClass = class of TFrmBase;
var
  sClassName, s: string;
  vForm: TFrmBase;
begin
  try
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
        vForm := TFrmBaseClass(FindClass(sClassName)).Create(AOwner);
    end;
    //显示Form
    try
      vForm.ID := AID;
      vForm.ImgIndex := AID mod 100;
      vForm.ShowModal;
    finally
      FreeAndNil(vForm);
    end;
  except
  end;
end;

procedure TFrmBase.ActGoBackExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmBase.actMainPageExecute(Sender: TObject);
begin
  //
end;

procedure TFrmBase.actNextPageExecute(Sender: TObject);
begin
  ImgIndex := ImgIndex + 1;
end;

procedure TFrmBase.ActOpenPageExecute(Sender: TObject);
var
  iPageIndex: Integer;
begin
  iPageIndex := TShape(Sender).Tag;
  if iPageIndex < 1000000 then Exit;
  //iPageIndex mod 1000000后，得到一个序号，对应的是下级页面TabControl的TabIndex值
  MsCreateForm(Self, Format('Tfrm%d', [1000000 * (iPageIndex div 1000000)]), iPageIndex);
end;

procedure TFrmBase.actPriorPageExecute(Sender: TObject);
begin
  ImgIndex := ImgIndex - 1;
end;

procedure TFrmBase.FormCreate(Sender: TObject);
begin
  InitEvent;
  FUseGesture := True;
  LoadCfg;
end;

procedure TFrmBase.FormDestroy(Sender: TObject);
begin
  if FCfg <> nil then FreeAndNil(FCfg);  
end;

procedure TFrmBase.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    Key := 0;
    Self.Close;
  end;
end;

procedure TFrmBase.InitEvent;
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

      //主页
      if Self.Components[i].Name = 'raMainPage' then
      begin
        TRectangle(Self.Components[I]).OnClick := actMainPageExecute;
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
        TShape(Self.Components[I]).OnClick := ActOpenPageExecute;
        TShape(Self.Components[I]).Cursor := crHandPoint;
      end;

    end;
  	DebugInf('MS - %s', [Self.Components[I].Name]);
  end;
end;

function TFrmBase.LoadCfg: TQJson;
begin
  FCfg := TQJson.Create;
  FCfg.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'cfg.dat');
end;

procedure TFrmBase.LoadImage(AImgName: string);
var
	sImgFile: string;
begin
  try
    //tcPage.TabIndex := 0;    //这句话必须加，因为基类里边设置了TabIndex
    sImgFile := Format('%sImage\%s', [ExtractFilePath(ParamStr(0)), AImgName]);
    if not FileExists(sImgFile) then
    begin
      MessageBox(FormToHWND(Self), PWideChar(Format('缺少图片！'#13'%s', [sImgFile])), '提示', MB_ICONWARNING);
      Exit;
    end;
    raImage.Fill.Kind := TBrushKind.Bitmap;
    raImage.Fill.Bitmap.Bitmap.LoadFromFile(sImgFile);
  except on E: Exception do
    DebugInf('MS - [%s-LoadImage] fail [%s]', [Self.ClassName, E.Message]);
  end;
end;

procedure TFrmBase.raImageMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  FGestureX := X;
end;

procedure TFrmBase.raImageMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
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

procedure TFrmBase.SetImgIndex(const Value: Integer);
var
  sImgFile: string;
  vJson: TQJson;
begin
  if FCfg = nil then Exit;  

  vJson := FCfg.ForcePath(Format('%d', [ID div 100 * 100]));
  if vJson = nil then Exit;

  if vJson.Count = 0 then Exit;
  if Value < 0 then Exit;
  if Value > vJson.Count - 1 then Exit;  
  FImgIndex := Value;

  sImgFile := Format('%s\%s', [vJson[FImgIndex].ForcePath('Dir').AsString, vJson[FImgIndex].ForcePath('ImgName').AsString]);
  LoadImage(sImgFile);  
end;

end.
