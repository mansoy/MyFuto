unit uFuns;

interface

uses
  FMX.Forms, System.Classes, System.SysUtils, FMX.Dialogs, uFrmBase, uGlobal;


procedure ClosePage(AClassName: string = '');
procedure CreateForm(AOwner: TComponent; AFormName: string; APageIndex: Integer);

implementation

procedure CloseOtherPages(AClassName: string = '');
var
  i: Integer;
  vForm: TForm;
begin
  for I:=0 to Screen.FormCount-1 do
  begin
    vForm := TForm(Screen.Forms[I]);
    if UpperCase(vForm.ClassName) = UpperCase('TMainForm') then
      Continue;
    if (AClassName <> '') then
    begin
     if not (vForm.ClassNameIs(AClassName)) then Continue;
    end;
    vForm.Close;
    //FreeAndNil(vForm);
    Break;
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

procedure CreateForm(AOwner: TComponent; AFormName: string; APageIndex: Integer);
  function GetFormByName(AFormName: string): TFrmBase;
  var
    i: Integer;
    vForm: TForm;
  begin
    Result := nil;
    for I:=0 to Screen.FormCount-1 do
    begin
      vForm := TForm(Screen.Forms[I]);
      if not (Screen.Forms[I].ClassNameIs(AFormName)) then
        Continue;
      Result := TFrmBase(Screen.Forms[I]);
      Break;
    end;
  end;
type
  TFormBaseClass = class of TFrmBase;
var
  vForm: TFrmBase;
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
    vForm.PageIndex := APageIndex;
    vForm.ShowModal;
  finally
    FreeAndNil(vForm);
  end;

end;

end.
