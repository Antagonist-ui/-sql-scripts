USE [master]
GO
/****** Object:  Database [KUTUPHANE]    Script Date: 11.02.2025 21:56:02 ******/
CREATE DATABASE [KUTUPHANE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KUTUPHANE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KUTUPHANE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KUTUPHANE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\KUTUPHANE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KUTUPHANE] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KUTUPHANE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KUTUPHANE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KUTUPHANE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KUTUPHANE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KUTUPHANE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KUTUPHANE] SET ARITHABORT OFF 
GO
ALTER DATABASE [KUTUPHANE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KUTUPHANE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KUTUPHANE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KUTUPHANE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KUTUPHANE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KUTUPHANE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KUTUPHANE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KUTUPHANE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KUTUPHANE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KUTUPHANE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KUTUPHANE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KUTUPHANE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KUTUPHANE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KUTUPHANE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KUTUPHANE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KUTUPHANE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KUTUPHANE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KUTUPHANE] SET RECOVERY FULL 
GO
ALTER DATABASE [KUTUPHANE] SET  MULTI_USER 
GO
ALTER DATABASE [KUTUPHANE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KUTUPHANE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KUTUPHANE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KUTUPHANE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KUTUPHANE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KUTUPHANE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'KUTUPHANE', N'ON'
GO
ALTER DATABASE [KUTUPHANE] SET QUERY_STORE = ON
GO
ALTER DATABASE [KUTUPHANE] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KUTUPHANE]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](25) NULL,
	[Soyad] [nvarchar](25) NULL,
	[Yas] [int] NULL,
	[Okul] [nvarchar](15) NULL,
	[Telefon] [nvarchar](15) NULL,
	[UyelıkTarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapID] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [nvarchar](25) NULL,
	[YazarID] [int] NULL,
	[Yayinevi] [nvarchar](50) NULL,
	[TurID] [int] NULL,
	[StokSayisi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[KitapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OduncAlimlar]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OduncAlimlar](
	[OduncID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[KitapID] [int] NULL,
	[VerilisTarihi] [datetime] NULL,
	[IadeTarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OduncID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Detay]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--1- Her bir yazarın yazdığı toplam kitap sayısını listele.
--SELECT Y.Ad, Y.Soyad, COUNT(K.KitapAd) KitapSayisi 
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON K.YazarID = Y.YazarID
--GROUP BY Y.Ad, Y.Soyad
--ORDER BY KitapSayisi DESC;



--2-Kitabı ödünç alınan yazarları listeleyiniz.
--SELECT DISTINCT Y.Ad, Y.Soyad
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON Y.YazarID = K.YazarID
--INNER JOIN OduncAlimlar O ON K.KitapID = O.KitapID;



--3-Kitapları ödünç alınmayan yazarları listeleyiniz. 
--SELECT DISTINCT Y.Ad, Y.Soyad
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON Y.YazarID = K.YazarID
--LEFT JOIN OduncAlimlar O ON K.KitapID = O.KitapID
--WHERE O.OduncID IS NULL;



--4-Ödünç alınan kitapların en fazla kaç günde iade edildiğini sırala.
--SELECT TOP 1 K.KitapAd, DATEDIFF(DAY, O.VerilisTarihi, O.IadeTarihi)IadeSuresi
--FROM OduncAlimlar O
--INNER JOIN Kitaplar K ON O.KitapID = K.KitapID
--ORDER BY IadeSuresi DESC;



--5-En çok ödünç alınan 2 kitabı listeleyin.
--SELECT TOP 2 K.KitapAd, COUNT(O.OduncID) AS OduncSayisi
--FROM OduncAlimlar O
--INNER JOIN Kitaplar K ON O.KitapID = K.KitapID
--GROUP BY K.KitapAd
--ORDER BY OduncSayisi DESC;



--6-Eğer bir üye 3 veya daha fazla kitap ödünç almışsa "Çok Okuyor", değilse "Az Okuyor" olacak bir view yapınız.
--CREATE VIEW UyeOkumaDurumu AS SELECT 
--    u.UyeID, 
--    u.Ad + ' ' + u.Soyad UyeAdi,
--    COUNT(o.KitapID)OduncSayisi,
--    'Az Okuyor' OkumaDurumu
--FROM Uyeler u
--LEFT JOIN OduncAlimlar o ON u.UyeID = o.UyeID
--WHERE (SELECT COUNT(*) FROM OduncAlimlar WHERE UyeID = U.UyeID) < 3
--GROUP BY u.UyeID, u.Ad, u.Soyad;

--CREATE VIEW UyeCokOkuyanlar AS SELECT 
--    u.UyeID, 
--    u.Ad + ' ' + u.Soyad UyeAdi,
--    COUNT(O.KitapID)OduncSayisi,
--    'Çok Okuyor' OkumaDurumu
--FROM Uyeler u
--LEFT JOIN OduncAlimlar o ON u..UyeID = o.UyeID
--WHERE (SELECT COUNT(*) FROM OduncAlimlar WHERE UyeID = u.UyeID) >= 3
--GROUP BY u.UyeID, u.Ad, u.Soyad;

--SELECT * FROM UyeOkumaDurumu;


--7-Ayda Duran üyesinin geçmişte ödünç almadığı kategorileri listeleyin.
--SELECT DISTINCT T.TurAdı 
--FROM Turler T
--LEFT JOIN Kitaplar K ON T.TurID = K.TurID
--LEFT JOIN OduncAlimlar O ON K.KitapID = O.KitapID AND O.UyeID = 3
--WHERE O.OduncID IS NULL;



--8-Telefon numarası olmayan üyeyi bul ve telefon numarasını ekle.
--IF EXISTS (SELECT 1 FROM Uyeler u WHERE u.UyeID = 4 AND u.Telefon IS NULL)
--BEGIN
--UPDATE Uyeler SET Telefon = '1234567890' 
--WHERE UyeID = 4
--PRINT 'Telefon numarası başarıyla eklendi.'
--END
--ELSE
--PRINT 'Telefon numarası zaten mevcut.'



--9-Yayınevi adı 'C' harfiyle başlayan yayınevlerini ve kitapları listele.
--SELECT k.KitapAd,k.Yayinevi
--FROM Kitaplar k
--WHERE YayinEvi LIKE 'C%' 
--GROUP BY k.KitapAd,k.Yayinevi
--ORDER BY k.KitapAd



--10-En çok ödünç verilen kitapları kategorilere göre listeleyin.
--SELECT t.TurAdı, COUNT(k.KitapID) AS OduncVerilenKitapSayisi
--FROM Turler t
--INNER JOIN Kitaplar k ON t.TurID = k.TurID
--INNER JOIN OduncAlimlar o ON k.KitapID = o.KitapID
--GROUP BY t.TurAdı
--ORDER BY OduncVerilenKitapSayisi DESC



--11-Her bir üyenin toplam kaç kitap ödünç aldığı bilgisini listeleyin.
--SELECT u.Ad, u.Soyad, SUM(o.KitapID)ToplamOduncKitapSayisi
--FROM OduncAlimlar o
--INNER JOIN Uyeler u ON o.UyeID = u.UyeID
--GROUP BY u.Ad, u.Soyad



--12-Ödünç alınan kitapların en uzun süreli olanını gösteriniz.
--SELECT TOP 1 KitapAd, DATEDIFF(DAY, o.VerilisTarihi, o.IadeTarihi)IadeSuresi
--FROM OduncAlimlar o
--INNER JOIN Kitaplar k ON o.KitapID = k.KitapID
--ORDER BY IadeSuresi DESC



--13- 18 yaş üstü kaç üye olduğunu ve bu üyelerin ortalamasını alan bir sorgu yazınız.
--SELECT 
--    COUNT(*) UyeSayisi, 
--    AVG(Yas) OrtalamaYas
--FROM Uyeler u
--WHERE u.Yas > 18;



--14-Ortalama ödünç verilen kitap sayısı kaçtır?
--SELECT 
--AVG(OduncSayisi)OrtalamaOduncVerilme
--FROM 
--(SELECT COUNT(o.OduncID)oduncSayisi
--FROM OduncAlimlar o
--GROUP BY o.KitapID)KitapOduncSayilari



--15-Bir kitap ödünç alındığında, tarihini ve ödünç alan üye bilgisini içeren bir görünüm (view) nasıl oluşturursunuz?
--CREATE VIEW Detay AS
--SELECT 
--    o.OduncID, 
--    o.KitapID, 
--    k.KitapAd, 
--    o.VerilisTarihi, 
--    o.IadeTarihi, 
--    u.UyeID, 
--    u.Ad, 
--    u.Soyad, 
--    u.Telefon
--FROM 
--    OduncAlimlar o
--INNER JOIN 
--    Kitaplar k ON o.KitapID = k.KitapID
--INNER JOIN 
--    Uyeler u ON o.UyeID = u.UyeID

--INSERT INTO Uyeler (Ad, Soyad, Telefon)
--VALUES ('Ayda', 'Duran', '5551234567');

--INSERT INTO Kitaplar (KitapAd, TurID, YazarID, YayinEvi)
--VALUES ('Atomik Alışkanlıklar', 1, 1, 1);

--INSERT INTO OduncAlimlar (KitapID, UyeID, VerilisTarihi, IadeTarihi)
--VALUES (1, 1, '2025-01-01', '2025-01-15');
--SELECT *FROM Detay



GO
/****** Object:  View [dbo].[UyeOkumaDurumu]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--1- Her bir yazarın yazdığı toplam kitap sayısını listele.
--SELECT Y.Ad, Y.Soyad, COUNT(K.KitapAd) KitapSayisi 
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON K.YazarID = Y.YazarID
--GROUP BY Y.Ad, Y.Soyad
--ORDER BY KitapSayisi DESC;



--2-Kitabı ödünç alınan yazarları listeleyiniz.
--SELECT DISTINCT Y.Ad, Y.Soyad
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON Y.YazarID = K.YazarID
--INNER JOIN OduncAlimlar O ON K.KitapID = O.KitapID;



--3-Kitapları ödünç alınmayan yazarları listeleyiniz. 
--SELECT DISTINCT Y.Ad, Y.Soyad
--FROM Yazarlar Y
--INNER JOIN Kitaplar K ON Y.YazarID = K.YazarID
--LEFT JOIN OduncAlimlar O ON K.KitapID = O.KitapID
--WHERE O.OduncID IS NULL;



--4-Ödünç alınan kitapların en fazla kaç günde iade edildiğini sırala.
--SELECT TOP 1 K.KitapAd, DATEDIFF(DAY, O.VerilisTarihi, O.IadeTarihi)IadeSuresi
--FROM OduncAlimlar O
--INNER JOIN Kitaplar K ON O.KitapID = K.KitapID
--ORDER BY IadeSuresi DESC;



--5-En çok ödünç alınan 2 kitabı listeleyin.
--SELECT TOP 2 K.KitapAd, COUNT(O.OduncID) AS OduncSayisi
--FROM OduncAlimlar O
--INNER JOIN Kitaplar K ON O.KitapID = K.KitapID
--GROUP BY K.KitapAd
--ORDER BY OduncSayisi DESC;

--6-Eğer bir üye 3 veya daha fazla kitap ödünç almışsa "Çok Okuyor", değilse "Az Okuyor" olacak bir view yapınız.
--CREATE VIEW UyeOkumaDurumu AS SELECT 
--    u.UyeID, 
--    u.Ad + ' ' + u.Soyad UyeAdi,
--    COUNT(o.KitapID)OduncSayisi,
--    'Az Okuyor' OkumaDurumu
--FROM Uyeler u
--LEFT JOIN OduncAlimlar o ON u.UyeID = o.UyeID
--WHERE (SELECT COUNT(*) FROM OduncAlimlar WHERE UyeID = U.UyeID) < 3
--GROUP BY u.UyeID, u.Ad, u.Soyad;

--CREATE VIEW UyeCokOkuyanlar AS SELECT 
--    u.UyeID, 
--    u.Ad + ' ' + u.Soyad UyeAdi,
--    COUNT(O.KitapID)OduncSayisi,
--    'Çok Okuyor' OkumaDurumu
--FROM Uyeler u
--LEFT JOIN OduncAlimlar o ON u..UyeID = o.UyeID
--WHERE (SELECT COUNT(*) FROM OduncAlimlar WHERE UyeID = u.UyeID) >= 3
--GROUP BY u.UyeID, u.Ad, u.Soyad;

--SELECT * FROM UyeOkumaDurumu;


--7-Ayda Duran üyesinin geçmişte ödünç almadığı kategorileri listeleyin.
--SELECT DISTINCT T.TurAdı 
--FROM Turler T
--LEFT JOIN Kitaplar K ON T.TurID = K.TurID
--LEFT JOIN OduncAlimlar O ON K.KitapID = O.KitapID AND O.UyeID = 3
--WHERE O.OduncID IS NULL;



--8-Telefon numarası olmayan üyeyi bul ve telefon numarasını ekle.
--IF EXISTS (SELECT 1 FROM Uyeler u WHERE u.UyeID = 4 AND u.Telefon IS NULL)
--BEGIN
--UPDATE Uyeler SET Telefon = '1234567890' 
--WHERE UyeID = 4
--PRINT 'Telefon numarası başarıyla eklendi.'
--END
--ELSE
--PRINT 'Telefon numarası zaten mevcut.'



--9-Yayınevi adı 'C' harfiyle başlayan yayınevlerini ve kitapları listele.
--SELECT k.KitapAd,k.Yayinevi
--FROM Kitaplar k
--WHERE YayinEvi LIKE 'C%' 
--GROUP BY k.KitapAd,k.Yayinevi
--ORDER BY k.KitapAd



--10-En çok ödünç verilen kitapları kategorilere göre listeleyin.
--SELECT t.TurAdı, COUNT(k.KitapID) AS OduncVerilenKitapSayisi
--FROM Turler t
--INNER JOIN Kitaplar k ON t.TurID = k.TurID
--INNER JOIN OduncAlimlar o ON k.KitapID = o.KitapID
--GROUP BY t.TurAdı
--ORDER BY OduncVerilenKitapSayisi DESC



--11-Her bir üyenin toplam kaç kitap ödünç aldığı bilgisini listeleyin.
--SELECT u.Ad, u.Soyad, SUM(o.KitapID)ToplamOduncKitapSayisi
--FROM OduncAlimlar o
--INNER JOIN Uyeler u ON o.UyeID = u.UyeID
--GROUP BY u.Ad, u.Soyad



--12-Ödünç alınan kitapların en uzun süreli olanını gösteriniz.
--SELECT TOP 1 KitapAd, DATEDIFF(DAY, o.VerilisTarihi, o.IadeTarihi)IadeSuresi
--FROM OduncAlimlar o
--INNER JOIN Kitaplar k ON o.KitapID = k.KitapID
--ORDER BY IadeSuresi DESC



--13- 18 yaş üstü kaç üye olduğunu ve bu üyelerin ortalamasını alan bir sorgu yazınız.
--SELECT 
--    COUNT(*) UyeSayisi, 
--    AVG(Yas) OrtalamaYas
--FROM Uyeler u
--WHERE u.Yas > 18;



--14-Ortalama ödünç verilen kitap sayısı kaçtır?
--SELECT 
--AVG(OduncSayisi)OrtalamaOduncVerilme
--FROM 
--(SELECT COUNT(o.OduncID)oduncSayisi
--FROM OduncAlimlar o
--GROUP BY o.KitapID)KitapOduncSayilari



--15-Bir kitap ödünç alındığında, tarihini ve ödünç alan üye bilgisini içeren bir görünüm (view) nasıl oluşturursunuz?
--CREATE VIEW Detay AS
--SELECT 
--    o.OduncID, 
--    o.KitapID, 
--    k.KitapAd, 
--    o.VerilisTarihi, 
--    o.IadeTarihi, 
--    u.UyeID, 
--    u.Ad, 
--    u.Soyad, 
--    u.Telefon
--FROM 
--    OduncAlimlar o
--INNER JOIN 
--    Kitaplar k ON o.KitapID = k.KitapID
--INNER JOIN 
--    Uyeler u ON o.UyeID = u.UyeID

--INSERT INTO Uyeler (Ad, Soyad, Telefon)
--VALUES ('Ayda', 'Duran', '5551234567');

--INSERT INTO Kitaplar (KitapAd, TurID, YazarID, YayinEvi)
--VALUES ('Atomik Alışkanlıklar', 1, 1, 1);

--INSERT INTO OduncAlimlar (KitapID, UyeID, VerilisTarihi, IadeTarihi)
--VALUES (1, 1, '2025-01-01', '2025-01-15');
--SELECT *FROM Detay



--16- Bir üyenin ödünç almadığı kitapları listeleyin.
--SELECT 
--    u.Ad,u.Soyad, 
--    o.KitapID, 
--    DATEDIFF(day, o.VerilisTarihi, GETDATE())FarkGun 
--FROM OduncAlimlar o
--INNER JOIN Uyeler u on o.UyeID=u.UyeID



--17- Ceza alan üyeleri ve kitapların kendilerine verildiği tarihi listeleyin.
--SELECT 
--    u.Ad + ' ' + u.Soyad AS UyeAdi,
--    o.VerilisTarihi AS OduncAlimTarihi,
--    c.CezaID
--FROM 
--    Uyeler u
--INNER JOIN 
--    OduncAlimlar o ON u.UyeID = o.UyeID
--INNER JOIN 
--    Cezalar c ON o.OduncID = c.OduncID
--WHERE 
--    c.CezaID IS NOT NULL
--ORDER BY 
--    u.Ad, u.Soyad



--18-Stoktaki kitap sayısını listeleyin.
--SELECT k.KitapAd, COUNT(k.KitapID), COUNT(o.KitapID)StoktaKalan
--FROM Kitaplar k
--LEFT JOIN OduncAlimlar o ON k.KitapID = o.KitapID
--GROUP BY k.KitapAd



--19-Ortaokulda olan üyeler tarafından ödünç alınan kitap varsa listele yoksa ödünç alınan kitap bulunamadı yaz.
--IF EXISTS (
--    SELECT 1
--    FROM Uyeler u
--    INNER JOIN OduncAlimlar o ON u.UyeID = o.UyeID
--    WHERE u.Okul = 'Ortaokul'
--)
--BEGIN
--    SELECT u.Ad, u.Soyad,u.Yas, k.KitapAd
--    FROM Uyeler u
--    INNER JOIN OduncAlimlar o ON u.UyeID = o.UyeID
--    INNER JOIN Kitaplar k ON o.KitapID = k.KitapID
--    WHERE u.Okul = 'Ortaokul'; 
--END
--ELSE
--BEGIN
--    PRINT 'Ödünç alınan kitap bulunamadı.';
--END;



--20-Bir üyenin tek seferde 3'ten fazla kitap ödünç almasını engelleyen bir trigger yazınız.
--CREATE TRIGGER KitapOduncKontrol ON OduncAlimlar
--AFTER INSERT AS
--BEGIN
--    DECLARE @UyeID INT;
--    DECLARE @KitapSayisi INT;
    
--    SELECT @UyeID = UyeID FROM inserted;
    
--    SELECT @KitapSayisi = COUNT(*) 
--    FROM OduncAlimlar
--    WHERE UyeID = @UyeID;
    
--    IF (@KitapSayisi > 3)
--    BEGIN
--        ROLLBACK;
--    END
--END;



GO
/****** Object:  Table [dbo].[Cezalar]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cezalar](
	[CezaID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[OduncID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CezaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turler]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turler](
	[TurID] [int] IDENTITY(1,1) NOT NULL,
	[TurAdı] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[TurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[YazarID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](25) NULL,
	[Soyad] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[YazarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cezalar] ON 

INSERT [dbo].[Cezalar] ([CezaID], [UyeID], [OduncID]) VALUES (1, 1, 3)
INSERT [dbo].[Cezalar] ([CezaID], [UyeID], [OduncID]) VALUES (2, 7, 6)
SET IDENTITY_INSERT [dbo].[Cezalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kitaplar] ON 

INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (1, N'Suç ve Ceza', 1, N'İş Bankası', 3, 4)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (2, N'1984', 2, N'Can Yayınları', 7, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (3, N'Dönüşüm', 3, N'Türkiye İş Bankası', 3, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (4, N'Sherlock Holmes', 4, N'Altın Kitaplar', 6, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (5, N'Sefiller', 5, N'İletişim Yayınları', 3, 6)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (6, N'Simyacı', 6, N'Can Yayınları', 9, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (7, N'Zahir', 6, N'Can Yayınları', 9, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (8, N'Tanrı Yanılgısı', 7, N'Kuzey Yayınları', 8, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (9, N'Gen Bencildir', 7, N'Kuzey Yayınları', 8, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (10, N'Zamanın Kısa Tarihi', 8, N'Alfa Yayınları', 4, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (15, N'Kendine Ait Bir Oda', 9, N'Sel Yayıncılık', 10, 4)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (16, N'Kürk Mantolu Madonna', 10, N'Yapı Kredi Yayınları', 3, 7)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (17, N'İçimizdeki Şeytan', 10, N'Yapı Kredi Yayınları', 3, 6)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (19, N'Beş Şehir', 11, N'Dergah Yayınları', 3, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (20, N'Aşk', 12, N'Doğan kitap', 9, 5)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (21, N'Ruhun Anatomisi', 13, N'Dharma Yayınları', 5, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (22, N'İnsanın Anlam Arayışı', 14, N'Okuyan Us', 5, 4)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (23, N'Yabancı', 15, N'Can Yayınları', 1, 5)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (24, N'Sisifos Söyleni', 15, N'Can Yayınları', 2, 6)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (25, N'Varoluşçuluk', 16, N'Say yayınları', 2, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (26, N'Tehlikeli Oyunlar', 17, N'İletişim Yayınları', 3, 4)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (27, N'Tutunamayanlar', 17, N'İletişim Yayınları', 3, 1)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (28, N'Kinyas Kayra', 18, N'Doğan Kitap', 1, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (29, N'Az', 18, N'Doğan Kitap', 1, 5)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (30, N'Daha', 18, N'Doğan Kitap', 1, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (31, N'Atomik Alışkanlıklar', 19, N'Pegasus Yayınları', 9, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (32, N'Etik 101', 20, N'Say Yayınları', 2, 2)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (33, N'Kozmos', 21, N'Alfa Yayınları', 4, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (34, N'On Küçük Zenci', 22, N'Altın Kitaplar', 6, 5)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (35, N'Doğu Ekspresinde Cinayet', 22, N'Altın Kitaplar', 6, 1)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (36, N'Roger Ackroyd Cinayeti', 22, N'Altın Kitaplar', 6, 4)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (37, N'Nutuk', 23, N'Türk Tarih Kurumu', 10, 3)
INSERT [dbo].[Kitaplar] ([KitapID], [KitapAd], [YazarID], [Yayinevi], [TurID], [StokSayisi]) VALUES (38, N'Atomik Alışkanlıklar', 1, N'1', 1, 1)
SET IDENTITY_INSERT [dbo].[Kitaplar] OFF
GO
SET IDENTITY_INSERT [dbo].[OduncAlimlar] ON 

INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (3, 1, 31, CAST(N'2024-11-11T00:00:00.000' AS DateTime), CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (4, 4, 3, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (5, 1, 32, CAST(N'2021-05-06T00:00:00.000' AS DateTime), CAST(N'2021-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (6, 7, 27, CAST(N'2024-12-15T00:00:00.000' AS DateTime), CAST(N'2025-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (7, 3, 32, CAST(N'2025-01-07T00:00:00.000' AS DateTime), CAST(N'2025-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (8, 3, 25, CAST(N'2025-01-07T00:00:00.000' AS DateTime), CAST(N'2025-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (9, 13, 15, CAST(N'2023-06-04T00:00:00.000' AS DateTime), CAST(N'2023-06-16T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (10, 13, 35, CAST(N'2023-06-19T00:00:00.000' AS DateTime), CAST(N'2023-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (11, 10, 8, CAST(N'2025-01-20T00:00:00.000' AS DateTime), CAST(N'2025-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (12, 12, 31, CAST(N'2025-01-07T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (13, 11, 31, CAST(N'2025-02-02T00:00:00.000' AS DateTime), CAST(N'2025-02-09T00:00:00.000' AS DateTime))
INSERT [dbo].[OduncAlimlar] ([OduncID], [UyeID], [KitapID], [VerilisTarihi], [IadeTarihi]) VALUES (14, 1, 1, CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-01-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[OduncAlimlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Turler] ON 

INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (1, N'Edebiyat')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (2, N'Felsefe')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (3, N'Klasikler')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (4, N'Bilim')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (5, N'Psikoloji')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (6, N'Polisiye')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (7, N'Bilimkurgu')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (8, N'Din')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (9, N'Kişisel Gelişim')
INSERT [dbo].[Turler] ([TurID], [TurAdı]) VALUES (10, N'Tarih')
SET IDENTITY_INSERT [dbo].[Turler] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (1, N'Hasan', N'Yelaldı', 24, N'Mezun', N'0551251580', CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (2, N'Yeşim', N'Güneş', 15, N'Lise', N'0547851568', CAST(N'2023-08-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (3, N'Ayda', N'Duran', 20, N'Ön Lisans', N'05521487545', CAST(N'2024-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (4, N'Hande', N'Boylu', 13, N'Ortaokul', N'1234567890', CAST(N'2024-10-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (5, N'Resul', N'Yılmaz', 17, N'Lise', N'05545987848', CAST(N'2024-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (6, N'Buse', N'Gezgin', 22, N'Lisans', N'05521548565', CAST(N'2024-10-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (7, N'Canan ', N'Tanrıverdi', 16, N'Lise', N'05214569814', CAST(N'2024-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (8, N'Sevda', N'Demir', 14, N'Ortaokul', N'05124512323', CAST(N'2024-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (9, N'Ahmet', N'Yiğit', 21, N'Ön Lisans', N'05541548777', CAST(N'2024-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (10, N'Melda', N'Aytaç', 24, N'Mezun', N'05551211212', CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (11, N'Gaye ', N'Önal', 20, N'Lise', N'05425899999', CAST(N'2024-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (12, N'Ceren', N'Yorgun', 14, N'Ortaokul', N'05458788984', CAST(N'2024-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (13, N'Pınar', N'Akar', 22, N'Lisans', N'05561231313', CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (14, N'Sevim ', N'Aydın', 21, N'Ön Lisans', N'05515487888', CAST(N'2024-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [Ad], [Soyad], [Yas], [Okul], [Telefon], [UyelıkTarihi]) VALUES (15, N'Ayda', N'Duran', NULL, NULL, N'5551234567', CAST(N'2025-02-11T15:34:08.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yazarlar] ON 

INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (1, N'Fyodor', N'Dostoyoyevski')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (2, N'George', N'Orwell')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (3, N'Franz', N'Kafka')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (4, N'Arthur Conan', N'Doyle')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (5, N'Victor', N'Hugo')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (6, N'Paulo', N'Coelho')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (7, N'Richard', N'Dawkins')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (8, N'Stephan', N'Hawking')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (9, N'Virginia ', N'Wolf')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (10, N'Sabahattin', N'Ali')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (11, N'Ahmet Hamdi', N'Tanpınar')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (12, N'Elif', N'Şafak')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (13, N'Liz', N'Greene')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (14, N'Viktor', N'Frankl')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (15, N'Albert ', N'Camus')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (16, N'Jean-Paul', N'Sartré')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (17, N'Oğuz ', N'Atay')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (18, N'Hakan ', N'Günday')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (19, N'James', N'Clear')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (20, N'Paul', N'Kleinman')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (21, N'Carl ', N'Sagan')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (22, N'Agatha', N'Cristie')
INSERT [dbo].[Yazarlar] ([YazarID], [Ad], [Soyad]) VALUES (23, N'Mustafa Kemal', N'Atatürk')
SET IDENTITY_INSERT [dbo].[Yazarlar] OFF
GO
ALTER TABLE [dbo].[Kitaplar] ADD  DEFAULT ((1)) FOR [StokSayisi]
GO
ALTER TABLE [dbo].[OduncAlimlar] ADD  DEFAULT (getdate()) FOR [VerilisTarihi]
GO
ALTER TABLE [dbo].[Uyeler] ADD  DEFAULT (getdate()) FOR [UyelıkTarihi]
GO
ALTER TABLE [dbo].[Cezalar]  WITH CHECK ADD FOREIGN KEY([OduncID])
REFERENCES [dbo].[OduncAlimlar] ([OduncID])
GO
ALTER TABLE [dbo].[Cezalar]  WITH CHECK ADD FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD FOREIGN KEY([TurID])
REFERENCES [dbo].[Turler] ([TurID])
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD FOREIGN KEY([YazarID])
REFERENCES [dbo].[Yazarlar] ([YazarID])
GO
ALTER TABLE [dbo].[OduncAlimlar]  WITH CHECK ADD FOREIGN KEY([KitapID])
REFERENCES [dbo].[Kitaplar] ([KitapID])
GO
ALTER TABLE [dbo].[OduncAlimlar]  WITH CHECK ADD FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([UyeID])
GO
/****** Object:  StoredProcedure [dbo].[Stok]    Script Date: 11.02.2025 21:56:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Stok]
    @KitapID INT,  -- Kitap adı yerine KitapID
    @UyeID INT     -- Kullanıcı adı yerine UyeID
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Kitaplar WHERE KitapID = @KitapID AND StokSayisi > 0)
    BEGIN
        -- Kitabı ödünç alma işlemi
        INSERT INTO OduncAlimlar (UyeID, KitapID) VALUES (@UyeID, @KitapID);

        -- Stoktan 1 düşme işlemi
        UPDATE Kitaplar SET StokSayisi = StokSayisi - 1 WHERE KitapID = @KitapID;

        PRINT 'Kitap ödünç alındı.';
    END
    ELSE
    BEGIN
        PRINT 'Kitap stokta yok!';
    END
END;
GO
USE [master]
GO
ALTER DATABASE [KUTUPHANE] SET  READ_WRITE 
GO
