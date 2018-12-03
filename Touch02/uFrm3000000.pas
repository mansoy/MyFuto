unit uFrm3000000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Gestures;

type
  TFrm3000000 = class(TForm)
    Rectangle1: TRectangle;
    procedure Rectangle1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm3000000: TFrm3000000;

procedure fnOpenThisForm(AOwner: TComponent);

implementation

{$R *.fmx}

procedure fnOpenThisForm(AOwner: TComponent);
var
  F: TFrm3000000;
begin
  F := TFrm3000000.Create(AOwner);
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;
end;

procedure TFrm3000000.Rectangle1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  //ShowMessage('1');
  //Self.ModalResult := mrOk;
end;

end.
