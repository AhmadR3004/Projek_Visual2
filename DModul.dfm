object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 270
  Width = 549
  object ZConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    HostName = 'localhost'
    Port = 3306
    Database = '2110020078'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 
      'C:\Data Pelajaran\UNISKA\MatKul\SEMESTER 4\P.Visual 2\2110020078' +
      '\libmysql.dll'
    Left = 256
    Top = 16
  end
  object QueryPengurus: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_pengurus')
    Params = <>
    Left = 32
    Top = 80
    object QueryPengurusnm_pengurus: TWideStringField
      FieldName = 'nm_pengurus'
      Required = True
      Size = 50
    end
    object QueryPenguruspassword: TWideStringField
      FieldName = 'password'
      Required = True
      Size = 25
    end
  end
  object QueryPeralatan: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select*from tb_peralatan')
    Params = <>
    Left = 112
    Top = 80
    object QueryPeralatankd_brg: TWideStringField
      DisplayLabel = 'Kode Barang'
      FieldName = 'kd_brg'
      Required = True
    end
    object QueryPeralatannm_brg: TWideStringField
      DisplayLabel = 'Nama Barang'
      DisplayWidth = 20
      FieldName = 'nm_brg'
      Required = True
      Size = 35
    end
    object QueryPeralatanno_reg: TWideStringField
      FieldName = 'no_reg'
      Required = True
    end
    object QueryPeralatankd_merk: TWideStringField
      DisplayLabel = 'Kode Merk'
      FieldName = 'kd_merk'
      Required = True
      Size = 30
    end
    object QueryPeralatanukuran: TWideStringField
      DisplayLabel = 'Ukuran'
      DisplayWidth = 10
      FieldName = 'ukuran'
      Required = True
      Size = 50
    end
    object QueryPeralatanno_prmbp: TWideStringField
      DisplayLabel = 'Kategori'
      DisplayWidth = 20
      FieldName = 'no_prmbp'
      Required = True
      Size = 50
    end
    object QueryPeralatanm_manfaat: TWideStringField
      DisplayLabel = 'Masa Manfaat'
      DisplayWidth = 20
      FieldName = 'm_manfaat'
      Required = True
      Size = 255
    end
    object QueryPeralatanth_pembelian: TIntegerField
      DisplayLabel = 'Tahun Beli'
      FieldName = 'th_pembelian'
      Required = True
    end
    object QueryPeralatankd_bag: TWideStringField
      DisplayLabel = 'Kode Bagian'
      FieldName = 'kd_bag'
      Required = True
      Size = 10
    end
    object QueryPeralatanhrg_perolehan: TIntegerField
      DisplayLabel = 'Harga'
      DisplayWidth = 20
      FieldName = 'hrg_perolehan'
      Required = True
    end
    object QueryPeralatantgl_input: TDateField
      DisplayLabel = 'Tanggal'
      FieldName = 'tgl_input'
      Required = True
    end
  end
  object DSPeralatan: TDataSource
    DataSet = QueryPeralatan
    Left = 112
    Top = 128
  end
  object QueryMerk: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_merk')
    Params = <>
    Properties.Strings = (
      'select*from ')
    Left = 188
    Top = 80
    object QueryMerkkd_merk: TWideStringField
      DisplayLabel = 'Kode Merek'
      DisplayWidth = 30
      FieldName = 'kd_merk'
      Required = True
      Size = 30
    end
    object QueryMerkmerk: TWideStringField
      DisplayLabel = 'Nama Merek'
      DisplayWidth = 40
      FieldName = 'merk'
      Required = True
      Size = 50
    end
  end
  object QueryBagian: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_bagian')
    Params = <>
    Left = 253
    Top = 80
    object QueryBagiankd_bagian: TWideStringField
      DisplayLabel = 'Kode bagian'
      FieldName = 'kd_bagian'
      Required = True
    end
    object QueryBagiannm_bagian: TWideStringField
      DisplayLabel = 'Nama bagian'
      FieldName = 'nm_bagian'
      Required = True
      Size = 50
    end
  end
  object QueryPegawai: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_pegawai')
    Params = <>
    Left = 324
    Top = 80
  end
  object QueryKategori: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_kategori')
    Params = <>
    Left = 484
    Top = 80
  end
  object QueryPemakaian: TZQuery
    Connection = ZConnection
    Active = True
    SQL.Strings = (
      'select * from tb_pemakaian')
    Params = <>
    Left = 404
    Top = 80
  end
  object DSMerk: TDataSource
    DataSet = QueryMerk
    Left = 191
    Top = 128
  end
  object DSBagian: TDataSource
    DataSet = QueryBagian
    Left = 256
    Top = 128
  end
end
