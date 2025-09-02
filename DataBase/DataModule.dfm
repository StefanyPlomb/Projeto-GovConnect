object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=GovConnect'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 128
    Top = 112
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Projeto-GovConnect\Win32\Debug\lib\libpq.dll'
    Left = 280
    Top = 112
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM usuarios;')
    Left = 264
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 264
    Top = 320
  end
end
