unit uFrmEditorText;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Dialogs, Vcl.Controls, Vcl.ExtCtrls
  , QJSON;

type
  TFrmEditorText = class(TForm)
    cmbFontName: TComboBox;
    spFontColor: TShape;
    ColorDialog1: TColorDialog;
    edtFontSize: TSpinEdit;
    spBackColor: TShape;
    btnSave: TButton;
    Button2: TButton;
    memText: TMemo;
    lblDescription: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    chkTransparentBackground: TCheckBox;
    procedure spFontColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cmbFontNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  end;

var
  FrmEditorText: TFrmEditorText;

  function fnOpenEditorText(AOwner: TComponent; AID: Integer): Boolean;

implementation

uses uCfg;

{$R *.dfm}

function fnOpenEditorText(AOwner: TComponent; AID: Integer): Boolean;
var
  F: TFrmEditorText;
begin
  F := TFrmEditorText.Create(AOwner);
  try
    Result := F.ShowModal = mrOk;
  finally
    FreeAndNil(F);
  end;
end;

procedure TFrmEditorText.btnSaveClick(Sender: TObject);
begin
  UI2D;
  Self.ModalResult := mrOk;
end;

procedure TFrmEditorText.cmbFontNameChange(Sender: TObject);
begin
  UpdateDisplay;
end;

procedure TFrmEditorText.D2UI;
begin
  memText.Text := FCfg.ForcePath('Texts.Text').AsString;
  spFontColor.Brush.Color  := FCfg.ForcePath('Font.FontColor').AsInt64;
  spBackColor.Brush.Color  := FCfg.ForcePath('Font.BackColor').AsInt64;
  chkTransparentBackground.Checked := FCfg.ForcePath('Font.BackTran').AsBoolean;
  cmbFontName.ItemIndex := cmbFontName.Items.IndexOf(FCfg.ForcePath('Font.Family').AsString);
  edtFontSize.Value    := FCfg.ForcePath('Font.Size').AsInteger;
end;

procedure TFrmEditorText.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FCfg);
end;

procedure TFrmEditorText.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  FID := 3000001;
  {$ENDIF}
  cmbFontName.Items := Screen.Fonts;
end;

procedure TFrmEditorText.FormShow(Sender: TObject);
var
  sJson: string;
begin
  if FCfg = nil then FCfg := TQJson.Create;
  sJson := GetCfg(FID);
  ShowMessage(sJson);
  FCfg.Parse(GetCfg(FID));
  D2UI;
end;

procedure TFrmEditorText.spFontColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ColorDialog1.Execute then
  begin
    TShape(Sender).Brush.Color := ColorDialog1.Color;
    UpdateDisplay;
  end;
end;

procedure TFrmEditorText.UI2D;
var
  vJson, vItem, vItems: TQJson;
  sCfg: string;
begin

  sCfg := ExtractFilePath(ParamStr(0)) + 'cfg.dat';
  vJson := TQJson.Create;
  try
    FCfg.ForcePath('Texts.Text').AsString     := memText.Text;
    FCfg.ForcePath('Font.Family').AsString    := cmbFontName.Items.Strings[cmbFontName.ItemIndex];
    FCfg.ForcePath('Font.Size').AsInteger       := edtFontSize.Value;
    FCfg.ForcePath('Font.FontColor').AsInt64  := spFontColor.Brush.Color;
    FCfg.ForcePath('Font.BackColor').AsInt64  := spBackColor.Brush.Color;
    FCfg.ForcePath('Font.BackTran').AsBoolean := chkTransparentBackground.Checked;

    vJson.LoadFromFile(sCfg);

    vJson.ForcePath('DescTexts.Font.Family').AsString   := FCfg.ForcePath('Font.Family').AsString;
    vJson.ForcePath('DescTexts.Font.Size').AsInteger      := FCfg.ForcePath('Font.Size').AsInteger;
    vJson.ForcePath('DescTexts.Font.FontColor').AsInt64 := FCfg.ForcePath('Font.FontColor').AsInt64;
    vJson.ForcePath('DescTexts.Font.BackColor').AsInt64      := FCfg.ForcePath('Font.BackColor').AsInt64;
    vJson.ForcePath('DescTexts.Font.BackTran').AsBoolean    := FCfg.ForcePath('Font.BackTran').AsBoolean;
    vItems := vJson.ForcePath('DescTexts.Texts');
    for vItem in vItems do
    begin
      if vItem.ForcePath('ID').AsInteger <> FCfg.ForcePath('Texts.ID').AsInteger then Continue;
      vItem.ForcePath('Text').AsString := FCfg.ForcePath('Texts.Text').AsString;
      Break;
    end;
    vJson.SaveToFile(sCfg);
  finally
    FreeAndNil(vJson);
  end;
end;

procedure TFrmEditorText.UpdateDisplay;
begin
  try
    if cmbFontName.Items.IndexOf(cmbFontName.Text) >= 0 then
    begin
      memText.Font.Name := cmbFontName.Items.Strings[cmbFontName.ItemIndex];
      lblDescription.Font.Name := memText.Font.Name;
    end;

    memText.Font.Size := edtFontSize.Value;
    lblDescription.Font.Size := edtFontSize.Value;

    memText.Font.Color := spFontColor.Brush.Color;
    lblDescription.Font.Color := spFontColor.Brush.Color;

    lblDescription.Color := spBackColor.Brush.Color;

    lblDescription.Caption := memText.Text;
    lblDescription.Left := (Self.Width - lblDescription.Width) div 2;

    lblDescription.Transparent := chkTransparentBackground.Checked;
    
  except

  end;
end;

end.
