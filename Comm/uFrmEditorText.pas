unit uFrmEditorText;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.ListBox, FMX.Edit, FMX.EditBox, FMX.NumberBox, FMX.Colors, FMX.ComboEdit, FMX.Objects
  , qjson, cxClasses, dxColorDialog;

type
  TFrmEditorText = class(TForm)
    Label1: TLabel;
    memText: TMemo;
    Label2: TLabel;
    nbFontSize: TNumberBox;
    Label3: TLabel;
    cbeFontFamily: TComboEdit;
    btnCancel: TButton;
    btnSave: TButton;
    txtDisplay: TText;
    raDisplay: TRectangle;
    Label4: TLabel;
    chkTransparentBackground: TCheckBox;
    dxColorDialog1: TdxColorDialog;
    raFontColor: TRectangle;
    rabackColor: TRectangle;
    procedure btnSaveClick(Sender: TObject);
    procedure memTextChangeTracking(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbeFontFamilyChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkTransparentBackgroundChange(Sender: TObject);
    procedure raFontColorClick(Sender: TObject);
  private
    { Private declarations }
    FID: Integer;
    FCfg: TQJson;
    procedure UI2D();
    procedure D2UI();
    procedure UpdateDisplay;
  public
    { Public declarations }
    property ID: Integer read FID write FID;
//    property Cfg: TQJson read FCfg write FCfg;
  end;

var
  FrmEditorText: TFrmEditorText;

  function fnOpenEditorText(AOwner: TComponent; AID: Integer): Boolean;

implementation

uses FMX.Printer, uCfg;

{$R *.fmx}

function fnOpenEditorText(AOwner: TComponent; AID: Integer): Boolean;
var
  F: TFrmEditorText;
  bOK: Boolean;
begin
  Result := False;
  bOK := False;
  F := TFrmEditorText.Create(AOwner);
  try
    F.ID := AID;
//    F.ShowModal(
//      procedure(ModalResult: TModalResult)
//      begin
//        if ModalResult = mrOK then
//        begin
//          bOK := True;
//        end;
//      end
//    );
    Result := F.ShowModal = mrOk;
    //Result := bOK;
  finally

  end;
end;

procedure TFrmEditorText.btnSaveClick(Sender: TObject);
begin
  UI2D;
  Self.ModalResult := mrOk;
end;

procedure TFrmEditorText.cbeFontFamilyChange(Sender: TObject);
begin
  UpdateDisplay;
end;

procedure TFrmEditorText.chkTransparentBackgroundChange(Sender: TObject);
begin
  if chkTransparentBackground.IsChecked then
  begin
    raDisplay.Fill.Kind := TBrushKind.None;
    raBackColor.Enabled := False;
  end else
  begin
    raDisplay.Fill.Kind := TBrushKind.Solid;
    raBackColor.Enabled := True;
  end;
end;

procedure TFrmEditorText.UI2D();
var
  vJson, vItem, vItems: TQJson;
  sCfg: string;
begin

  sCfg := ExtractFilePath(ParamStr(0)) + 'cfg.dat';
  vJson := TQJson.Create;
  try
    FCfg.ForcePath('Texts.Text').AsString     := memText.Text;
    FCfg.ForcePath('Font.Family').AsString    := cbeFontFamily.Items.Strings[cbeFontFamily.ItemIndex];
    FCfg.ForcePath('Font.Size').AsFloat       := nbFontSize.Value;
    FCfg.ForcePath('Font.FontColor').AsInt64  := raFontColor.Fill.Color;
    FCfg.ForcePath('Font.BackColor').AsInt64  := raBackColor.Fill.Color;
    FCfg.ForcePath('Font.BackTran').AsBoolean := chkTransparentBackground.IsChecked;

    vJson.LoadFromFile(sCfg);

    vJson.ForcePath('DescTexts.Font.Family').AsString   := FCfg.ForcePath('Font.Family').AsString;
    vJson.ForcePath('DescTexts.Font.Size').AsFloat      := FCfg.ForcePath('Font.Size').AsFloat;
    vJson.ForcePath('DescTexts.Font.FontColor').AsInt64 := FCfg.ForcePath('Font.FontColor').AsInt64;
    vJson.ForcePath('DescTexts.Font.BackColor').AsInt64      := FCfg.ForcePath('Font.BackColor').AsInt64;
    vJson.ForcePath('DescTexts.Font.BackTran').AsBoolean    := FCfg.ForcePath('Font.BackTran').AsBoolean;
    vItems := vJson.ForcePath('DescTexts.Texts');
    for vItem in vItems do
    begin
      if vItem.IntByName('ID', 0) <> FCfg.ForcePath('Texts.ID').AsInt64 then Continue;
      vItem.ForcePath('Text').AsString := FCfg.ForcePath('Texts.Text').AsString;
      Break;
    end;
    vJson.SaveToFile(sCfg);
  finally
    FreeAndNil(vJson);
  end;
end;

procedure TFrmEditorText.D2UI();
begin
  raFontColor.Fill.Color  := FCfg.ForcePath('Font.FontColor').AsInt64;
  raBackColor.Fill.Color  := FCfg.ForcePath('Font.BackColor').AsInt64;
  chkTransparentBackground.IsChecked := FCfg.ForcePath('Font.BackTran').AsBoolean;
  memText.Text := FCfg.ForcePath('Texts.Text').AsString;
  cbeFontFamily.ItemIndex := cbeFontFamily.Items.IndexOf(FCfg.ForcePath('Font.Family').AsString);
  nbFontSize.Value    := FCfg.ForcePath('Font.Size').AsFloat;
end;

procedure TFrmEditorText.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
  FreeAndNil(FCfg);
end;

procedure TFrmEditorText.FormCreate(Sender: TObject);
begin
  cbeFontFamily.Items := Printer.Fonts;
  //cbeFontFamily.Items.
end;

procedure TFrmEditorText.FormShow(Sender: TObject);
begin
  if FCfg = nil then FCfg := TQJson.Create;  
  FCfg.Parse(GetCfg(FID));
  D2UI;
end;

procedure TFrmEditorText.memTextChangeTracking(Sender: TObject);
begin
  UpdateDisplay;
end;

procedure TFrmEditorText.raFontColorClick(Sender: TObject);
begin
  if dxColorDialog1.Execute then
  begin
    TRectangle(Sender).Fill.Color := dxColorDialog1.Color;
    UpdateDisplay;
  end;
end;

procedure TFrmEditorText.UpdateDisplay;
begin
  try
    if cbeFontFamily.Items.IndexOf(cbeFontFamily.Text) >= 0 then
    begin
      memText.TextSettings.Font.Family := cbeFontFamily.Items.Strings[cbeFontFamily.ItemIndex];
      txtDisplay.TextSettings.Font.Family := memText.TextSettings.Font.Family;
    end;

    memText.TextSettings.Font.Size := nbFontSize.Value;
    txtDisplay.TextSettings.Font.Size := nbFontSize.Value;

    memText.TextSettings.FontColor := raFontColor.Fill.Color;
    txtDisplay.TextSettings.FontColor := raFontColor.Fill.Color;

    raDisplay.Fill.Color := raBackColor.Fill.Color;

    txtDisplay.Text := memText.Text;
    txtDisplay.Position.X := 0;
    txtDisplay.Position.Y := 0;
    raDisplay.Width := txtDisplay.Width;
    raDisplay.Height := txtDisplay.Height;
    raDisplay.Position.X := (Self.Width * 1.0 - raDisplay.Width) / 2;
  except

  end;
end;

end.
