unit uFuns;

interface

uses
   Winapi.Windows, FMX.Forms, System.Classes, System.SysUtils, FMX.Dialogs, uFrmTabBase;


/// <summary>
/// 关闭类名为AClassName的窗口
/// </summary>
/// <param name="AClassName">窗口类名</param>
procedure ClosePage(AClassName: string = '');
/// <summary>
/// 关闭除类名为AClassName和主窗口之外的所有的窗口
/// </summary>
/// <param name="AClassName">窗口类名</param>
procedure CloseOtherPages(AClassName: string = '');
/// <summary>
/// 创建一个窗口
/// </summary>
/// <param name="AOwner"></param>
/// <param name="AFormName"></param>
/// <param name="APageIndex"></param>
procedure CreateForm(AOwner: TComponent; AFormName: string; AID: Integer);

/// <summary>
/// 创建一个窗口
/// </summary>
function MsCreateForm(AOwner: TComponent; AFormName: string): TForm;

/// <summary>
/// 打印调试信息
/// </summary>
/// <param name="AClassName"></param>
function DebugInf(const Format: string; const Args: array of const): Boolean;

implementation


procedure CloseOtherPages(AClassName: string = '');
var
  i: Integer;
  vForm: TFrmTabBase;
begin
  for I:=0 to Screen.FormCount-1 do
  begin
    vForm := TFrmTabBase(Screen.Forms[I]);
    if vForm.ID = 1000000 then
    //if UpperCase(vForm.ClassName) = UpperCase('TMainForm') then
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

procedure ClosePage(AClassName: string = '');
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

procedure CreateForm(AOwner: TComponent; AFormName: string; AID: Integer);
  function GetFormByName(AFormName: string): TFrmTabBase;
  var
    i: Integer;
  begin
    Result := nil;
    for I:=0 to Screen.FormCount-1 do
    begin
      if not (Screen.Forms[I].ClassNameIs(AFormName)) then
        Continue;
      Result := TFrmTabBase(Screen.Forms[I]);
      Break;
    end;
  end;
type
  TFormTabBaseClass = class of TFrmTabBase;
var
  vForm: TFrmTabBase;
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
      vForm := TFormTabBaseClass(FindClass(sClassName)).Create(AOwner);
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
    vForm.PageIndex := AID mod 100;
    vForm.ShowModal;
  finally
    FreeAndNil(vForm);
  end;

end;

function MsCreateForm(AOwner: TComponent; AFormName: string): TForm;
  function GetFormByName(AFormName: string): TForm;
  var
    i: Integer;
  begin
    Result := nil;
    for I:=0 to Screen.FormCount-1 do
    begin
      if not (Screen.Forms[I].ClassNameIs(AFormName)) then
        Continue;
      Result := TForm(Screen.Forms[I]);
      Break;
    end;
  end;
type
  TFormClass = class of TForm;
var
  sClassName, s: string;
begin
  Result := nil;
  try
    Result := GetFormByName(AFormName);
    if Result = nil then
    begin
      //创建
      s := Copy(Trim(AFormName), 1, 1);
      if (s <> 'T') and (s <> 't') then
        sClassName := 'T' + Trim(AFormName)
      else
        sClassName := Trim(AFormName);
      if GetClass(sClassName)<>nil then
        Result := TFormClass(FindClass(sClassName)).Create(AOwner);
    end;
  except
  end;
end;


function DebugInf(const Format: string; const Args: array of const): Boolean;
//{$IFDEF DEBUG}
var
  sInfo: string;
//{$ENDIF}
begin
  Result := False;
  //{$IFDEF DEBUG}
  sInfo := System.SysUtils.Format(Format, Args, FormatSettings);
  OutputDebugString(PWideChar(sInfo));
  //{$ENDIF}
  Result := True;
end;
end.
