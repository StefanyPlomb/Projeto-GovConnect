unit TesteBanco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  FireDAC.Comp.Client, DataModule;

type
  TForm4 = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure PreencherGrid;
  public
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  StringGrid1.ColCount := 5;
  StringGrid1.FixedRows := 1;
  StringGrid1.RowCount := 2;

  // Cabeçalhos iniciais
  StringGrid1.Cells[0,0] := 'ID';
  StringGrid1.Cells[1,0] := 'Nome';
  StringGrid1.Cells[2,0] := 'Email';
  StringGrid1.Cells[3,0] := 'Senha';
  StringGrid1.Cells[4,0] := 'Perfil';

  // Ajuste inicial das colunas
  StringGrid1.ColWidths[0] := 50;  // ID
  StringGrid1.ColWidths[1] := 150; // Nome
  StringGrid1.ColWidths[2] := 200; // Email
  StringGrid1.ColWidths[3] := 100; // Senha
  StringGrid1.ColWidths[4] := 50;  // Perfil
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  // Abre a query
  DataModule1.FDQuery1.Close;
  DataModule1.FDQuery1.SQL.Text := 'SELECT id, nome, email, senha, perfil_id FROM Usuarios';
  DataModule1.FDQuery1.Open;

  // Preenche a grid
  PreencherGrid;
end;

procedure TForm4.PreencherGrid;
var
  i: Integer;
begin
  // Se não houver registros, mostra mensagem na grid
  if DataModule1.FDQuery1.RecordCount = 0 then
  begin
    StringGrid1.RowCount := 2;
    StringGrid1.Cells[0,1] := 'Sem registros';
    Exit;
  end;

  StringGrid1.RowCount := DataModule1.FDQuery1.RecordCount + 1;
  i := 1;
  DataModule1.FDQuery1.First;
  while not DataModule1.FDQuery1.Eof do
  begin
    StringGrid1.Cells[0,i] := DataModule1.FDQuery1.FieldByName('id').AsString;
    StringGrid1.Cells[1,i] := DataModule1.FDQuery1.FieldByName('nome').AsString;
    StringGrid1.Cells[2,i] := DataModule1.FDQuery1.FieldByName('email').AsString;
    StringGrid1.Cells[3,i] := DataModule1.FDQuery1.FieldByName('senha').AsString;
    StringGrid1.Cells[4,i] := DataModule1.FDQuery1.FieldByName('perfil_id').AsString;

    Inc(i);
    DataModule1.FDQuery1.Next;
  end;
end;

end.

