unit ufrmmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  CPort;

type

  { TFrmMain }

  TFrmMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    ComPort1: TComPort;
    Edit1: TEdit;
    Memo1: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComPort1AfterClose(Sender: TObject);
    procedure ComPort1AfterOpen(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private

  public

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.lfm}

{ TFrmMain }

procedure TFrmMain.Button1Click(Sender: TObject);
begin
    if ComPort1.Connected then
    ComPort1.Close
  else
    ComPort1.Open;
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
    ComPort1.ShowSetupDialog;
end;

procedure TFrmMain.Button3Click(Sender: TObject);
var
  Str: String;
begin
  Str := edit1.Text;
  if CheckBox1.Checked then
    Str := Str + #13#10;
  ComPort1.WriteStr(Str);

end;

procedure TFrmMain.ComPort1AfterClose(Sender: TObject);
begin
    if button1 <> nil then
    button1.Caption := 'Open';
end;

procedure TFrmMain.ComPort1AfterOpen(Sender: TObject);
begin
  button1.Caption:='Close';
end;

procedure TFrmMain.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  Str: String;
begin
  ComPort1.ReadStr(Str, Count);
  Memo1.Text := Memo1.Text + Str;

end;

end.

