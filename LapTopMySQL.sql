drop database laptopstore;
create database LapTopStore;
use LapTopStore;
------------- Table ---------------
/*==============================================================*/
/* Table: TAIKHOAN                 		                        */
/*==============================================================*/
create table TAIKHOAN
(
   TENDANGNHAP          varchar(20) not null,
   MATKHAU              varchar(20) not null,
   QUYEN                varchar(20) not null,
   primary key (TENDANGNHAP)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: NHANVIEN                                        */
/*==============================================================*/
create table NHANVIEN
(
   MANV                 char(6) not null,
   TENDANGNHAP          varchar(20) not null,
   TENNV                varchar(50),
   NGAYSINH             date,
   GIOITINH             char(5),
   CHUCVU               varchar(10),
   DIACHI               varchar(100),
   NGAYVL               date,
   SODT                 char(12),
   primary key (MANV)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: KHACHHANG                                       */
/*==============================================================*/
create table KHACHHANG
(
   MAKH                 char(6) not null,
   TENDANGNHAP          varchar(20) not null,
   TENKH                varchar(50),
   SODT                 char(12),
   EMAIL                varchar(50),
   GIOITINH             char(5),
   primary key (MAKH)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: SANPHAM                                         */
/*==============================================================*/
create table SANPHAM
(
   MASP                 char(6) not null,
   MANHINH              char(5) not null,
   BOXULY               char(5) not null,
   RAM                  char(5) not null,
   CONGKETNOI           char(5) not null,
   DANHMUC              char(6) not null,
   TENSP                varchar(1000),
   SOLUONG              int,
   MAUSAC               varchar(20),
   OCUNG                varchar(200),
   CARDMANHINH          varchar(100),
   DACBIET              varchar(100),
   HDH                  varchar(100),
   THIETKE              varchar(50),
   KICHTHUOC_TRONGLUONG varchar(100),
   WEBCAM               varchar(50),
   PIN                  varchar(50),
   RAMAT                int,
   MOTA                 varchar(200),
   DONGIA               bigint,
   HINHANH              varchar(200),
   primary key (MASP)
)DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: BONHORAM                                        */
/*==============================================================*/
create table BONHORAM
(
   MARAM                char(5) not null,
   DUNGLUONGRAM         varchar(50),
   LOAIRAM              varchar(100),
   BUSRAM               varchar(50),
   HOTROTOIDA           varchar(50),
   primary key (MARAM)
) DEFAULT CHARSET=utf8mb4 ;

/*==============================================================*/
/* Table: BOXULY                                          */
/*==============================================================*/
create table BOXULY
(
   MABXL                char(5) not null,
   CONGNGHECPU          varchar(50),
   SONHAN               int,
   SOLUONG              int,
   TOCDOCPU             varchar(20),
   TOCDOTOIDA           varchar(50),
   BONHODEM             varchar(10),
   primary key (MABXL)
) DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: CONGKETNOI                                      */
/*==============================================================*/
create table CONGKETNOI
(
   MACKN                char(5) not null,
   CONGGIAOTIEP         varchar(200),
   KETNOIKHONGDAY       varchar(100),
   KHEDOCTHENHO         varchar(20),
   WEBCAM               varchar(50),
   TINHNANGKHAC         varchar(200),
   DENBANPHIM           varchar(10),
   primary key (MACKN)
) DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: MANHINH                                         */
/*==============================================================*/
create table MANHINH
(
   MAMH                 char(5) not null,
   KICHTHUOC            varchar(20),
   DOPHANGIAI           varchar(50),
   TANSOQUET            varchar(10),
   CONGNGHEMH           varchar(100),
   CAMUNG               varchar(10),
   primary key (MAMH)
)DEFAULT CHARSET=utf8mb4;

/*==============================================================*/
/* Table: SUKIEN                                          */
/*==============================================================*/
create table SUKIEN
(
   MASK                 char(6) not null,
   TENSK                varchar(50),
   PHANTRAMGIAMGIA      int,
   NGAYBD               date,
   NGAYKT               date,
   primary key (MASK)
) default charset = utf8mb4;


/*==============================================================*/
/* Table: DANHMUCSANPHAM                                  */
/*==============================================================*/
create table DANHMUCSANPHAM
(
   MADM                 char(6) not null,
   TENDM                varchar(50),
   primary key (MADM)
) default charset = utf8mb4;

/*==============================================================*/
/* Table:HOADON                                          */
/*==============================================================*/
create table HOADON
(
   MAHD                 char(6) not null,
   MAKH                 char(6) not null,
   MANV                 char(6) not null,
   MASK                 char(6),
   NGAYHD               date,
   DIACHIGIAOHANG       varchar(100),
   TONGTIEN             int,
   THANHTIEN            int,
   primary key (MAHD)
) default charset = utf8mb4;

/*==============================================================*/
/* Table: CTHD                                            */
/*==============================================================*/
create table CTHD
(
   MAHD                 char(6) not null,
   MASP                 char(6) not null,
   SOLUONG              int,
   primary key (MAHD, MASP)
) default charset = utf8mb4;


/*==============================================================*/
/* KHOA NGOAI                                                   */
/*==============================================================*/

alter table CTHD add constraint FK_CTHD foreign key (MAHD)
      references HOADON (MAHD) on delete restrict on update restrict;

alter table CTHD add constraint FK_CTHD2 foreign key (MASP)
      references SANPHAM (MASP) on delete restrict on update restrict;

alter table HOADON add constraint FK_HD_SK foreign key (MASK)
      references SUKIEN (MASK) on delete restrict on update restrict;

alter table HOADON add constraint FK_LAP foreign key (MANV)
      references NHANVIEN (MANV) on delete restrict on update restrict;

alter table HOADON add constraint FK_THUOC foreign key (MAKH)
      references KHACHHANG (MAKH) on delete restrict on update restrict;

alter table KHACHHANG add constraint FK_CO2 foreign key (TENDANGNHAP)
      references TAIKHOAN (TENDANGNHAP) on delete restrict on update restrict;

alter table NHANVIEN add constraint FK_CO1 foreign key (TENDANGNHAP)
      references TAIKHOAN (TENDANGNHAP) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC1 foreign key (DANHMUC)
      references DANHMUCSANPHAM (MADM) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC3 foreign key (RAM)
      references BONHORAM (MARAM) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC4 foreign key (MANHINH)
      references MANHINH (MAMH) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC5 foreign key (BOXULY)
      references BOXULY (MABXL) on delete restrict on update restrict;

alter table SANPHAM add constraint FK_THUOC6 foreign key (CONGKETNOI)
      references CONGKETNOI (MACKN) on delete restrict on update restrict;

commit;

/*------------------- AUTO ID --------------------------*/

/*----- AUTOID_KHACHHANG ----*/

DROP FUNCTION IF EXISTS AUTO_IDKH;
DELIMITER $$
CREATE FUNCTION AUTO_IDKH()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MAKHNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MAKH) FROM KHACHHANG) = 0 THEN
		SET MAKHNEW = 'KH0001';
	ELSE
		SELECT MAX(RIGHT(MAKH, 4)) INTO ID from khachhang;
			if ID >= 0 and ID < 9 THEN 
				set MAKHNEW = CONCAT('KH000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 9 and ID < 99 THEN
				SET MAKHNEW = CONCAT('KH00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            IF ID >= 99 and ID < 999 THEN
				SET MAKHNEW = CONCAT('KH0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            IF ID >= 999 THEN
				SET MAKHNEW = CONCAT('KH',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));     
			end if;
	end if;
	RETURN (MAKHNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_KH;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_KH
    BEFORE INSERT
    ON KHACHHANG FOR EACH ROW
BEGIN
	SET NEW.MAKH = AUTO_IDKH();
END$$    
DELIMITER ;

/*----- AUTOID_NHANVIEN ----*/

DROP FUNCTION IF EXISTS AUTO_IDNV;
DELIMITER $$
CREATE FUNCTION AUTO_IDNV()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MANVNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MANV) FROM NHANVIEN) = 0 THEN
		SET MANVNEW = 'NV0001';
	ELSE
		SELECT MAX(RIGHT(MANV, 4)) INTO ID from NHANVIEN;
			if ID >= 0 and ID < 9 THEN 
				set MANVNEW = CONCAT('NV000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 9 and ID < 99 THEN
				SET MANVNEW = CONCAT('NV00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
            IF ID >= 99 and ID < 999 THEN
				SET MANVNEW = CONCAT('NV0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				END IF;
			IF ID >= 999 THEN
				SET MANVNEW = CONCAT('NV',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				END IF;
			
	end if;
	RETURN (MANVNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_NV;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_NV
    BEFORE INSERT
    ON NHANVIEN FOR EACH ROW
BEGIN
	SET NEW.MANV = AUTO_IDNV();
END$$    
DELIMITER ;

/*----- AUTOID_BONHORAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDRAM;
DELIMITER $$
CREATE FUNCTION AUTO_IDRAM()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MARAMNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MARAM) FROM BONHORAM) = 0 THEN
		SET MARAMNEW = 'RAM01';
	ELSE
		SELECT MAX(RIGHT(MARAM, 2)) INTO ID from BONHORAM;
			if ID >= 0 and ID < 9 THEN 
				set MARAMNEW = CONCAT('RAM0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MARAMNEW = CONCAT('RAM',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MARAMNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_RAM;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_RAM
    BEFORE INSERT
    ON BONHORAM FOR EACH ROW
BEGIN
	SET NEW.MARAM = AUTO_IDRAM();
END$$    
DELIMITER ;

/*----- AUTOID_BOXULY ----*/

DROP FUNCTION IF EXISTS AUTO_IDBXL;
DELIMITER $$
CREATE FUNCTION AUTO_IDBXL()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MABXLNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MABXL) FROM BOXULY) = 0 THEN
		SET MABXLNEW = 'BXL01';
	ELSE
		SELECT MAX(RIGHT(MABXL, 2)) INTO ID from BOXULY;
			if ID >= 0 and ID < 9 THEN 
				set MABXLNEW = CONCAT('BXL0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MABXLNEW = CONCAT('BXL',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MABXLNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_BXL;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_BXL
    BEFORE INSERT
    ON BOXULY FOR EACH ROW
BEGIN
	SET NEW.MABXL = AUTO_IDBXL();
END$$    
DELIMITER ;

/*----- AUTOID_CONGKETNOI ----*/

DROP FUNCTION IF EXISTS AUTO_IDCKN;
DELIMITER $$
CREATE FUNCTION AUTO_IDCKN()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MACKNNEW VARCHAR(5);
    declare ID VARCHAR(2);
	IF (SELECT COUNT(MACKN) FROM CONGKETNOI) = 0 THEN
		SET MACKNNEW = 'CKN01';
	ELSE
		SELECT MAX(RIGHT(MACKN, 2)) INTO ID from CONGKETNOI;
			if ID >= 0 and ID < 9 THEN 
				set MACKNNEW = CONCAT('CKN0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 THEN
					SET MACKNNEW = CONCAT('CKN',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				 END IF;
            end if;
	end if;
	RETURN (MACKNNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_CKN;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_CKN
    BEFORE INSERT
    ON CONGKETNOI FOR EACH ROW
BEGIN
	SET NEW.MACKN = AUTO_IDCKN();
END$$    
DELIMITER ;

/*----- AUTOID_MANHINH ----*/

DROP FUNCTION IF EXISTS AUTO_IDMH;
DELIMITER $$
CREATE FUNCTION AUTO_IDMH()
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
	DECLARE MAMHNEW VARCHAR(5);
    declare ID VARCHAR(3);
	IF (SELECT COUNT(MAMH) FROM MANHINH) = 0 THEN
		SET MAMHNEW = 'MH001';
	ELSE
		SELECT MAX(RIGHT(MAMH, 3)) INTO ID from MANHINH;
			if ID >= 0 and ID < 9 THEN 
				set MAMHNEW = CONCAT('MH00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			 END IF;
			IF ID >= 9 and ID < 99 THEN
					SET MAMHNEW = CONCAT('MH0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
			IF ID >= 99 THEN
					SET MAMHNEW = CONCAT('MH',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
	end if;
	RETURN (MAMHNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_MH;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_MH
    BEFORE INSERT
    ON MANHINH FOR EACH ROW
BEGIN
	SET NEW.MAMH = AUTO_IDMH();
END$$    
DELIMITER ;sanpham

/*----- AUTOID_DANHMUCSANPHAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDDMSP;
DELIMITER $$
CREATE FUNCTION AUTO_IDDMSP()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MADMNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MADM) FROM DANHMUCSANPHAM) = 0 THEN
		SET MADMNEW = 'DM0001';
	ELSE
		SELECT MAX(RIGHT(MADM, 4)) INTO ID from DANHMUCSANPHAM;
			if ID >= 0 and ID < 9 THEN 
				set MADMNEW = CONCAT('DM000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 9 and ID < 99 THEN 
				set MADMNEW = CONCAT('DM00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 99 and ID < 999 THEN 
				set MADMNEW = CONCAT('DM0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 999 THEN
					SET MADMNEW = CONCAT('DM',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
           
	end if;
	RETURN (MADMNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_DMSP;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_DMSP
    BEFORE INSERT
    ON DANHMUCSANPHAM FOR EACH ROW
BEGIN
	SET NEW.MADM = AUTO_IDDMSP();
END$$    
DELIMITER ;

/*----- AUTOID_SANPHAM ----*/

DROP FUNCTION IF EXISTS AUTO_IDSP;
DELIMITER $$
CREATE FUNCTION AUTO_IDSP()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MASPNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MASP) FROM SANPHAM) = 0 THEN
		SET MASPNEW = 'SP0001';
	ELSE
		SELECT MAX(RIGHT(MASP, 4)) INTO ID from SANPHAM;
			If ID >= 0 and ID < 9 THEN 
				set MASPNEW = CONCAT('SP000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 9 and ID < 99 THEN 
				set MASPNEW = CONCAT('SP00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
            if ID >= 99 and ID < 999 THEN 
				set MASPNEW = CONCAT('SP0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			end if;
			IF ID >= 999 THEN
					SET MASPNEW = CONCAT('SP',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			END IF;
	end if;
	RETURN (MASPNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_SP;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_SP
    BEFORE INSERT
    ON SANPHAM FOR EACH ROW
BEGIN
	SET NEW.MASP = AUTO_IDSP();
END$$    
DELIMITER ;

/*----- AUTOID_HOADON ----*/
DROP FUNCTION IF EXISTS AUTO_IDHD;
DELIMITER $$
CREATE FUNCTION AUTO_IDHD()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MAHDNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MAHD) FROM HOADON) = 0 THEN
		SET MAHDNEW = 'HD0001';
	ELSE
		SELECT MAX(RIGHT(MAHD, 4)) INTO ID from HOADON;
			if ID >= 0 and ID < 9 THEN 
				set MAHDNEW = CONCAT('HD000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 and ID < 99 THEN
				SET MAHDNEW = CONCAT('HD00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 99 and ID < 999 THEN
				SET MAHDNEW = CONCAT('HD0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
            ELSE IF ID >= 999 and ID < 9999 THEN
				SET MAHDNEW = CONCAT('HD',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				end if;
				end if;
				end if;
			end if;
	end if;
	RETURN (MAHDNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_HD;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_HD
    BEFORE INSERT
    ON HOADON FOR EACH ROW
BEGIN
	SET NEW.MAHD = AUTO_IDHD();
END$$    
DELIMITER ;

/*----- AUTOID_SUKIEN ----*/
DROP FUNCTION IF EXISTS AUTO_IDSK;
DELIMITER $$
CREATE FUNCTION AUTO_IDSK()
RETURNS VARCHAR(6)
DETERMINISTIC
BEGIN
	DECLARE MASKNEW VARCHAR(6);
    declare ID VARCHAR(4);
	IF (SELECT COUNT(MASK) FROM SUKIEN) = 0 THEN
		SET MASKNEW = 'SK0001';
	ELSE
		SELECT MAX(RIGHT(MASK, 4)) INTO ID from SUKIEN;
			if ID >= 0 and ID < 9 THEN 
				set MASKNEW = CONCAT('SK000',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 9 and ID < 99 THEN
				SET MASKNEW = CONCAT('SK00',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
			ELSE IF ID >= 99 and ID < 999 THEN
				SET MASKNEW = CONCAT('SK0',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
            ELSE IF ID >= 999 and ID < 9999 THEN
				SET MASKNEW = CONCAT('SK',CONVERT((CONVERT(ID, UNSIGNED) + 1),CHAR));
				end if;
				end if;
				end if;
			end if;
	end if;
	RETURN (MASKNEW);
END$$ 
DELIMITER ;

DROP TRIGGER IF EXISTS trigger_AUTO_ID_SK;
DELIMITER $$
CREATE TRIGGER trigger_AUTO_ID_SK
    BEFORE INSERT
    ON SUKIEN FOR EACH ROW
BEGIN
	SET NEW.MASK = AUTO_IDSK();
END$$    
DELIMITER ;

/*------------------- TINH TIEN HOA DON ----------------------------*/

DROP TRIGGER IF EXISTS TRG_INSERT_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_INSERT_CTHD
    BEFORE INSERT
    ON CTHD FOR EACH ROW
BEGIN
	SET @TONGTIEN = NEW.SOLUONG * (SELECT DONGIA FROM SANPHAM WHERE MASP = NEW.MASP);
    update HOADON
    SET TONGTIEN = TONGTIEN + @TONGTIEN
	WHERE MAHD = NEW.MAHD;
    update SANPHAM
    SET SOLUONG = SOLUONG - NEW.SOLUONG
	WHERE MASP = NEW.MASP;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_UPDATE_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_UPDATE_CTHD
    BEFORE UPDATE
    ON CTHD FOR EACH ROW
BEGIN
	IF(NEW.SOLUONG > OLD.SOLUONG) THEN
		SET @TONGTIEN = (NEW.SOLUONG - OLD.SOLUONG) * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN + @TONGTIEN
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG - (NEW.SOLUONG - OLD.SOLUONG)
		WHERE MASP = NEW.MASP;
	ELSE IF(NEW.SOLUONG < OLD.SOLUONG) THEN
		SET @TONGTIEN = (OLD.SOLUONG - NEW.SOLUONG) * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN - @TONGTIEN
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG + (OLD.SOLUONG - NEW.SOLUONG)
		WHERE MASP = NEW.MASP;
        END IF;
        END IF;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_DELETE_CTHD;
DELIMITER $$
CREATE TRIGGER TRG_DELETE_CTHD
    BEFORE DELETE
    ON CTHD FOR EACH ROW
BEGIN
		SET @TONGTIEN = OLD.SOLUONG * (SELECT DONGIA FROM SANPHAM WHERE MASP = OLD.MASP);
		UPDATE HOADON
		SET TONGTIEN = TONGTIEN - @TONGTIEN	
		WHERE MAHD = OLD.MAHD;
        UPDATE SANPHAM
		SET SOLUONG = SOLUONG + OLD.SOLUONG
		WHERE MASP = OLD.MASP;
END$$    
DELIMITER ;

DROP TRIGGER IF EXISTS TRG_UPDATE_HD;
DELIMITER $$
CREATE TRIGGER TRG_UPDATE_HD
    BEFORE UPDATE
    ON HOADON FOR EACH ROW
BEGIN
	SET @GIAMGIA = (SELECT PHANTRAMGIAMGIA FROM SUKIEN WHERE MASK = NEW.MASK);
        SET NEW.THANHTIEN = NEW.TONGTIEN * (100 - @GIAMGIA) / 100 ;
	
END$$    
DELIMITER ;

/*------------------- INSERT ----------------------------*/
        insert into TaiKhoan values ('Cquynh','8813','user');
        insert into TaiKhoan values ('cuongpham','5010','admin');
        insert into TaiKhoan values ('dungnguyen','8571','admin');
        insert into TaiKhoan values ('dungtran','3146','admin');
        insert into TaiKhoan values ('duongnguyen','7899','user');
        insert into TaiKhoan values ('hangta','4673','user');
        insert into TaiKhoan values ('hienvu','2792','user');
        insert into TaiKhoan values ('hongluong','1524','user');
        insert into TaiKhoan values ('huedinh','9782','user');
        insert into TaiKhoan values ('huongquach','6494','user');
        insert into TaiKhoan values ('huyduong','5804','user');
        insert into TaiKhoan values ('khanhnhuoc','2426','user');
        insert into TaiKhoan values ('linhtong','6765','user');
        insert into TaiKhoan values ('manhhung','2562','admin');
        insert into TaiKhoan values ('minhpham','3010','user');
        insert into TaiKhoan values ('nguyenmy','1439','user');
        insert into TaiKhoan values ('nhilam','8016','user');
        insert into TaiKhoan values ('phatvo','9981','user');
        insert into TaiKhoan values ('tamphan','2919','admin');
        insert into TaiKhoan values ('thangnguyen','6759','user');
        insert into TaiKhoan values ('thaonguyen','2941','user');
        insert into TaiKhoan values ('thongnguyen','3525','user');
        insert into TaiKhoan values ('thuantrg','7762','user');
        insert into TaiKhoan values ('thunga','8675','admin');
        insert into TaiKhoan values ('thuyle','7978','admin');
        insert into TaiKhoan values ('trangvu','4567','admin');
        insert into TaiKhoan values ('tringuyen','4733','user');
        insert into TaiKhoan values ('tuandung','7032','admin');
        insert into TaiKhoan values ('tuyetle','6682','user');
        insert into TaiKhoan values ('vietan','6000','admin');
        
		insert into NhanVien values ('','vietan','Nguy???n Vi???t An','2000-01-01','NAM','QL','????? Xu??n H???p, qu???n 9, TPHCM','2022-02-02','0123456789');
        insert into NhanVien values ('','manhhung','B??i M???nh H??ng','1981-02-10','NAM','NV','Linh Trung, Th??? ?????c, TPHCM','2022-02-20','0372411691');
        insert into NhanVien values ('','dungnguyen','Nguy???n Qu???c D??ng','1987-07-26','NAM','NV','Phan V??n Tr???, G?? V???p, TPHCM','2020-04-01','0852728837');
        insert into NhanVien values ('','cuongpham','Ph???m M???nh C?????ng','1983-12-01','NAM','NV','khu K1, Ninh Thu???n','2020-06-06','0734158157');
        insert into NhanVien values ('','tuandung','B??i Tu???n D??ng','1987-05-30','NAM','NV','Ung V??n Khi??m, B??nh Th???nh, TPHCM','2019-06-30','0683289218');
        insert into NhanVien values ('','thuyle','L?? Th??? Th???y','1991-07-15','N???','NV','Pastuer, Qu???n 1, TPHCM','2020-05-27','0722776540');
        insert into NhanVien values ('','dungtran','Tr???n Th??? Dung','1989-05-13','N???','NV','C???ng H??a, T??n B??nh, TPHCM','2022-05-23','0146881148');
        insert into NhanVien values ('','tamphan','Phan Tr???ng T??m','1984-06-06','NAM','NV','Nam K??? Kh???i Ngh??a, qu???n 3, TPHCM','2020-06-01','0466144184');
        insert into NhanVien values ('','thunga','Tr???n Thu Nga','1975-05-25','N???','NV','H???ng B??ng, Qu???n 5, TPHCM','2019-04-05','0993140653');
        insert into NhanVien values ('','trangvu','V?? Thu Trang','1992-02-06','N???','NV','S?? V???n H???nh, qu???n 10, TPHCM','2020-06-21','0619414581');

        insert into KhachHang values ('','Cquynh','Chu Qu???nh','0123456789','chuquynh12340@gmail.com','N???');
        insert into KhachHang values ('','nguyenmy','Nguy???n Th??? Tr?? My','0766224933','mytra.ngu12349@gmail.com','N???');
        insert into KhachHang values ('','thaonguyen','Nguy???n Ph????ng Th???o','083293345','thaopn1234@gmail.com','N???');
        insert into KhachHang values ('','huongquach','Qu??ch Tuy???t H????ng','0352615642','huongqt112346@gmail.com','N???');
        insert into KhachHang values ('','duongnguyen','Nguy???n Th??nh D????ng','0723773634','nguyenduong22112347@gmail.com','NAM');
        insert into KhachHang values ('','hienvu','V?? Thu Hi???n','0484274854','hien.vu12349@gmail.com','N???');
        insert into KhachHang values ('','thuantrg','Tr????ng Qu???c Thu???n','0543382327','quocthuan349100@gmail.com','NAM');
        insert into KhachHang values ('','huedinh','??inh B??ch Hu???','0616886120','huedinhbich1596200@gmail.com','N???');
        insert into KhachHang values ('','hongluong','L????ng Thu H???ng','0915493221','thuhong154630@gmail.com','N???');
        insert into KhachHang values ('','hangta','T??? Minh H???ng','0213391315','hang.ta552045@gmail.com','N???');
        insert into KhachHang values ('','minhpham','Ph???m Ch?? Minh','0391568616','tieumen25730@gmail.com','NAM');
        insert into KhachHang values ('','khanhnhuoc','Nguy???n Nh?????c Kh??nh','0718315362','khanhnhuoc@gmail.com','NAM');
        insert into KhachHang values ('','thangnguyen','Nguy???n Qu???c Th???ng','059201876','thang300065@gmail.com','NAM');
        insert into KhachHang values ('','tringuyen','Nguy???n Minh Tr??','0415397463','triminhnguyen4420@gmail.com','NAM');
        insert into KhachHang values ('','thongnguyen','Nguy???n ????nh Th??ng','0432741325','thong.nguyen1532100@gmail.com','NAM');
        insert into KhachHang values ('','tuyetle','L?? ??nh Tuy???t','0432741586','tuyetle114520@gmail.com','N???');
        insert into KhachHang values ('','huyduong','Nguy???n D????ng Huy','0363130852','duonghuy1450687@gmail.com','NAM');
        insert into KhachHang values ('','linhtong','T???ng M??? Linh','0427102366','mylinh04052001630@gmail.com','N???');
        insert into KhachHang values ('','nhilam','L??m Uy??n Nhi','0326257961','uyennhi286008896@gmail.com','N???');
        insert into KhachHang values ('','phatvo','V?? Quang Long Ph??t','0636670280','longphat15560@gmail.com','NAM');
        
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'MacBook');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Asus');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'HP');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Lenovo');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Acer');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Dell');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'Msi');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'LG');
INSERT INTO `laptopstore`.`danhmucsanpham` (`MADM`, `TENDM`) VALUES ('', 'GIGABYTE');

insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','60Hz','C??ng ngh??? IPSLED','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','240Hz','100% DCI-P3, T???m n???n IPS, Ch???ng ch??i Anti Glare','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','360Hz','100% sRGB, Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','17.3 inch','Full HD (1920x1080)','240Hz','T???m n???n IPS','Kh??ng');
insert into manhinh values ('','16 inch','QHD+ (2560 x 1600)','120Hz','100% DCI-P3, T???m n???n IPS','C??');
insert into manhinh values ('','13.4 inch','Full HD+ (1920 x 1200)','60Hz','100% sRGB, 500 nits Glossy, T???m n???n IPS','C??');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','T???m n???n IPS','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','LED T???m n???n IPS','Kh??ng');
insert into manhinh values ('','17 inch','WQXGA (2560 x 1600)','60 Hz','Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','16 inch','WQXGA (2560 x 1600)','60 Hz','Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','14 inch','WUXGA (1920 x 1200)','60 Hz','Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','14 inch','4K/UHD(3840x21600)','60Hz','500 nits Glossy,  90% DCI-P3, HDR Ves400, T???m n???n IPS','c??');
insert into manhinh values ('','13 inch','WQHD (2160x1350)','60Hz','T???m n???n IPS, 450 nits Glossy, Dolby Vision','C??');
insert into manhinh values ('','13.3 inch','QHD (2560 x 1600)','60Hz','300 nits Glossy, Ch???ng ch??i Anti Glarem, Dolby Vision, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','14 inch','Full HD (1920 x 1080)','60Hz','300 nits Glossy, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920 x 1080)','120Hz','T???m n???n IPS, Ch???ng ch??i Anti-Glare, 250 nits','c??');
insert into manhinh values ('','15.6 inch','Full HD (1920 x 1080)','60 Hz','TFT, AcerComfyview, LED backlit','Kh??ng');
insert into manhinh values ('','14 inch','Full HD (1920x1080)','144Hz','Ch???ng ch??i Anti Glare, T???m n???n IPS','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','144Hz','T???m n???n IPS, AcerComfyview, LED backlit','Kh??ng');
insert into manhinh values ('','15.6 inch','Full HD (1920x1080)','120Hz','LED, WVA','kh??ng');
insert into manhinh values ('','15.6 inch','QHD (2560 x 1600)','165Hz','T???m n???n IPS, AcerComfyview, LED backlit, TFT','Kh??ng');

        insert into congketnoi values ('','2 x USB 3.2, 2 x USB Type-C, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','','HD webcam','','C??');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, USB 2.0, USB Type-C','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','B???n l??? m??? 180 ?????','C??');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','SD','FHD (30fps@1080p)','????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','','Camera IR','M??? kh??a khu??n m???t????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','SD','FHD (30fps@1080p)','????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort','Bluetooth 5.2Wi-Fi 6 (802.11ax)','SD','HD webcam','????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, 2 x USB 3.2, HDMI,Jack tai nghe 3.5 mm','Bluetooth 5.2Wi-Fi 6E (802.11ax)','Micro SD','Camera IR, HD webcam','B???o m???t v??n tay, C??ng t???c kh??a camera, M??? kh??a khu??n m???t','C??');
        insert into congketnoi values ('','1 x USB 3.2, 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mmUSB Type-C','Bluetooth 5.2Wi-Fi 6E (802.11ax)','Micro SD','Camera IRHD webcam','B???o m???t v??n tay, C??ng t???c kh??a camera, M??? kh??a khu??n m???t, Ti??u chu???n N???n Intel Evo','C??');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 3 x USB 3.2, HDMI, LAN (RJ45), Mini DisplayPort, USB Type-C','Wi-Fi 6 (802.11ax)Bluetooth 5.1','SD','HD webcam','????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, 2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','B???o m???t v??n tayTi??u chu???n N???n Intel Evo','C??');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Mini DisplayPort, USB 2.0, USB Type-C','Bluetooth 5.2Wi-Fi 6 (802.11ax)','SD','HD webcam','','C??');
        insert into congketnoi values ('','1 x USB 3.2, 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm','Bluetooth 5.1, Wi-Fi 6 (802.11ax)','','HD webcam','B???o m???t v??n tay, C??ng t???c kh??a camera, Ti??u chu???n N???n Intel Evo','C??');
        insert into congketnoi values ('','2 x USB Type-C (Power Delivery and DisplayPort), USB Type-C, Jack tai nghe 3.5 mm','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','Micro SD','Sau 5 MP, tr?????c 5 MPCamera IR','Digital Pen, M??? kh??a khu??n m???t','c??');
        insert into congketnoi values ('','2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm, USB Type-C','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','Camera IR , HD webcam','B???n l??? m??? 180 ?????, M??? kh??a khu??n m???t, Ti??u chu???n N???n Intel Evo, ????? b???n chu???n qu??n ?????i MLT STD 810G','C??');
        insert into congketnoi values ('','1 x USB 3.2 (Always on), 2 x Thunderbolt 4 USB-C, Jack tai nghe 3.5 mm','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','HD webcam','B???o m???t v??n tay, C??ng t???c kh??a camera, Ti??u chu???n N???n Intel Evo, TPM 2.0','C??');
        insert into congketnoi values ('','1 x USB 3.2, 1 x USB 3.2 (Always on), HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, USB Type-C (support data transfer, Power Delivery 3.0 and DisplayPort 1.4)','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','Micro SD ','HD webcam','B??t c???m ???ng, B???o m???t v??n tay, C??ng t???c kh??a camera','C??');
        insert into congketnoi values ('','2 x USB 3.2, 2 x USB Type-C, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45)','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','','HD webcam','C??ng t???c kh??a camera','C??');
        insert into congketnoi values ('','1 x USB 3.2, 1 x USB 3.2 (Always on), HDMI, Jack tai nghe 3.5 mm, Thunderbolt 4 USB-C, USB Type-C (support data transfer, Power Delivery 3.0 and DisplayPort 1.4)','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','B??t c???m ???ng, B???o m???t v??n tay, C??ng t???c kh??a camera','c??');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Thunderbolt 4 USB-C, USB Type-C','Bluetooth 5.1Wi-Fi 6 (802.11ax)','Micro SD','HD webcam','B???n l??? m??? 180 ?????, B???o m???t v??n tay, C??ng t???c kh??a camera, ????? b???n chu???n qu??n ?????i MLT STD 810H','Kh??ng');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB Type-C','Bluetooth 5.1 Wi-Fi 6 (802.11ax)','','HD webcam','????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','HDMIUSB 3.12 x USB 2.0LAN (RJ45)Jack tai nghe 3.5 mm','Bluetooth 5.0Wi-Fi 802.11 a/b/g/n/ac','','VGA webcam ','B???n l??? m??? 180 ?????','Kh??ng');
        insert into congketnoi values ('','2 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), USB 2.0','BluetoothWi-Fi 802.11 a/b/g/n/ac','SD','HD webcam','','kh??ng');
        insert into congketnoi values ('','Jack tai nghe 3.5 mm, 1 x USB 3.2, HDMI, LAN (RJ45), Thunderbolt 3, 2 x USB 2.0, Mini DisplayPort','Bluetooth 5.0 Wi-Fi 6 (802.11ax)','SD','HD webcam','B???o m???t v??n tay','c??');
        insert into congketnoi values ('','3 x USB 3.2, HDMI, Jack tai nghe 3.5 mm, LAN (RJ45), Mini DisplayPort, Thunderbolt 4 USB-C','Bluetooth 5.1Wi-Fi 6 (802.11ax)','','HD webcam','C??ng ngh??? qu???t AeroBlade 3D th??? h??? 5 2 qu???t t???n nhi???t????n b??n ph??m chuy???n m??u RGB','C??');
        insert into congketnoi values ('','1 x USB 3.2 2 x USB 2.0 HDMI Jack tai nghe 3.5 mm USB Type-C','Bluetooth 4.1Wi-Fi 802.11 a/b/g/n/ac','',' VGA Webcam',' B???o m???t v??n tay','Kh??ng');
        insert into congketnoi values ('','2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm','Bluetooth 5.0Wi-Fi 6 (802.11ax)','','720p FaceTime Camera',' B???o m???t v??n tay',' C??');
        
       
        
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','3200MHz','64 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe r???i)','3200MHz','64 GB');
        insert into BONHORAM values ('','32 GB','DDR4 2 khe (1 khe 16GB + 1 khe 16GB)','3200MHz','64 GB');
        insert into BONHORAM values ('','16 GB','LPDDR4X (8GB On board + 8GB On board)','2133 MHz (H??ng c??ng b???)','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','16 GB','LPDDR4 (On board)','2133 MHz (H??ng c??ng b???)','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','16 GB','DDR4 (2 khe)','2666 MHz','32 GB');
        insert into BONHORAM values ('','16 GB','LPDDR4X (On board)','4266 MHz','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe r???i)','4266 MHz','');
        insert into BONHORAM values ('','16GB','LPDDR4 (On board)','4266 MHz','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','8GB','DDR4 (On board)','2666 MHz','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','8GB','DDR4 (On board)','3200 MHz','Kh??ng h??? tr??? n??ng c???p');
		insert into BONHORAM values ('','8GB','DDR4 2 khe (1 khe 8GB onboard + 1 khe tr???ng)','3200MHz','40GB');
        insert into BONHORAM values ('','8GB','DDR4 (2 khe)','2933 MHz','16GB');
        insert into BONHORAM values ('','16GB','DDR4 2 khe (8GB onboard+ 1 khe 8GB)','3200 MHz','40 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe r???i)','3200 MHz','32 GB');
        insert into BONHORAM values ('','4 GB','DDR4 2 khe (1 khe 4GB + 1 khe r???i)','2400 MHz','12 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe r???i)','2666 MHz','16 GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 8GB + 1 khe r???i)','2666 MHz','32GB');
        insert into BONHORAM values ('','16GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','2933 MHz','16GB');
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','2700 MHz','32 GB');
        insert into BONHORAM values ('','16 GB','DDR4 2 khe (1 khe 8GB + 1 khe 8GB)','3200 MHz','32 GB');
        insert into BONHORAM values ('','8GB','','','');
        insert into BONHORAM values ('','16GB','','','');
        insert into BONHORAM values ('','32GB','','','');
        insert into BONHORAM values ('','8 GB','LPDDR4X (On board)','4267 MHz','Kh??ng h??? tr??? n??ng c???p');
        insert into BONHORAM values ('','4GB','LPDDR4X (On board)','3200 MHz','20GB');
        insert into BONHORAM values ('','8 GB','DDR4 2 khe (1 khe 4GB + 1 khe 4GB)','3200 MHz','32 GB');
        
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10500H',6,12,'2.50 GHz','Turbo Boost 4,5GHZ','12MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1155G7',4,8,'2.50 GHz','Turbo Boost 4,5GHZ','8MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 11800H',8,16,'2.30 GHz','Turbo Boost 4.6 GHz','24MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1195G7',4,8,'2.90 GHz','Turbo Boost 5.0 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1185G7',4,8,'3.00 GHz','Turbo Boost 4.8 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Comet Lake - 10750H',6,12,'2.60 GHz','Turbo Boost 5.0 GHz','12MB');
        insert into BOXULY values ('','Intel Core i7 Tiger Lake - 1165G7',4,8,'2.80 GHz','Turbo Boost 4.7 GHz','12MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 11400H',6,12,'2.70 GHz','Turbo Boost 4,5 GHZ','12MB');
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10500H',6,12,'2.50 GHz','Turbo Boost 4,5 GHZ','12MB');
        insert into BOXULY values ('','Intel Core i7 Comet Lake - 10510U',4,8,'1.80 GHz','Turbo Boost 4.9 GHz','8MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8 MB');
        insert into BOXULY values ('','Intel Core i5 Comet Lake - 10210U',4,8,'1.6GHz','Turbo Boost 4.2 GHz','6 MB');
        insert into BOXULY values ('','Intel Core i3 Ice Lake - 1005G1',2,4,'1.2 GHz','Turbo Boost 3.4 GHz','4 MB');
        insert into BOXULY(MABXL,CONGNGHECPU) values ('','Apple M1');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8 MB');
        insert into BOXULY values ('','Intel Core i3 Tiger Lake - 1115G4',2,4,'3 GHz','Turbo Boost 4.1 GHz','6 MB');
        insert into BOXULY values ('','Intel Core i5 Tiger Lake - 1135G7',4,8,'2.40 GHz','Turbo Boost 4.2 GHz','8MB');
        insert into BOXULY values ('','AMD Ryzen 5 - 5600H',6,12,'3.30 GHz','Turbo Boost 4.2 GHz','16 MB');
        
insert into sanpham values ('','MH010','BXL14','RAM22','CKN26','DM0001','Laptop Apple MacBook Air M1 2020 8GB/256GB/7-core GPU (MGN63SA/A)',3,'Tr???ng','256 GB SSD','Card t??ch h???p7 nh??n GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 304.1 mm - R???ng 212.4 mm - D??y 4.1 mm ?????n 16.1 mm - N???ng 1.29 kg','','Kho???ng 10 ti???ng',2020,'','27490000','/HinhAnh/SP001.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/512GB (Z11C)',5,'X??m','512 GB SSD','Card t??ch h???p8 nh??n GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 304.1 mm - R???ng 212.4 mm - D??y 15.6 mm - N???ng 1.4 kg','','Kho???ng 10 ti???ng',2020,'','44990000','/HinhAnh/SP002.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/512GB (Z11A)',5,'??en','512 GB SSD','Card t??ch h???p8 nh??n GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 304.1 mm - R???ng 212.4 mm - D??y 15.6 mm - N???ng 1.4 kg','','Kho???ng 10 ti???ng',2020,'','44990001','/HinhAnh/SP003.jpg');
insert into sanpham values ('','MH012','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Max 2021 10 core-CPU/32GB/1TB SSD/32 core-GPU (MK1A3SA/A)',4,'??en','1 TB SSD','Card t??ch h???p32 core-GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 355.7 mm - R???ng 248.1 mm - D??y 16.8 mm - N???ng 2.2 kg','','Kho???ng 10 ti???ng',2021,'','90990000','/HinhAnh/SP004.jpg');
insert into sanpham values ('','MH011','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Max 2021 10 core-CPU/32GB/1TB SSD/32 core-GPU (MK1A3SA/A)',3,'X??m','1 TB SSD','Card t??ch h???p32 core-GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 355.7 mm - R???ng 248.1 mm - D??y 16.8 mm - N???ng 2.2 kg','','Kho???ng 10 ti???ng',2021,'','88990000','/HinhAnh/SP005.jpg');
insert into sanpham values ('','MH012','BXL14','RAM24','CKN26','DM0001','Laptop Apple MacBook Pro 16 M1 Pro 2021 10 core-CPU/16GB/1TB SSD/16 core-GPU (MK193SA/A)',4,'??en','1 TB SSD','Card t??ch h???p32 core-GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 355.7 mm - R???ng 248.1 mm - D??y 16.8 mm - N???ng 2.2 kg','','Kho???ng 10 ti???ng',2020,'','45112000','/HinhAnh/SP006.jpg');
insert into sanpham values ('','MH010','BXL14','RAM23','CKN26','DM0001','Laptop Apple MacBook Pro M1 2020 16GB/1TB SSD (Z11C000CJ)',2,'??en','1 TB SSD','Card t??ch h???p32 core-GPU','','Mac OS','V??? kim lo???i nguy??n kh???i','D??i 355.7 mm - R???ng 248.1 mm - D??y 16.8 mm - N???ng 2.2 kg','','Kho???ng 10 ti???ng',2020,'','50990000','/HinhAnh/SP007.jpg');
insert into sanpham values ('','MH015','BXL15','RAM25','CKN01','DM0002','Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/C??p/T??i/Win10 (KG363T)',5,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 304.2 mm - R???ng 203 mm - D??y 13.9 mm - N???ng 1.14 kg','','4-cell Li-ion, 67 Wh',2021,'','23790000','/HinhAnh/SP008.jpg');
insert into sanpham values ('','MH015','BXL15','RAM25','CKN02','DM0002','Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/C??p/T??i/Win10 (KG363A)',10,'X??m','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 304.2 mm - R???ng 203 mm - D??y 13.9 mm - N???ng 1.14 kg','','4-cell Li-ion, 67 Wh',2021,'','23790000','/HinhAnh/SP009.jpg');
insert into sanpham values ('','MH020','BXL07','RAM25','CKN07','DM0002','Laptop Asus TUF Gaming FX516PC i7 11370H/8GB/512GB/4GB RTX3050/144Hz/Win10 (HN001T)',10,'??en','513 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 305 mm - R???ng 211 mm - D??y 11.9 mm - N???ng 1.3 kg','','4-cell Li-ion, 67 Wh',2020,'','23790000','/HinhAnh/SP010.jpg');
insert into sanpham values ('','MH020','BXL07','RAM04','CKN08','DM0002','Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/C??p/T??i/Win10 (HP548T) ',12,'??en','SSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 305 mm - R???ng 211 mm - D??y 11.9 mm - N???ng 1.3 kg','','4-cell Li-ion, 67 Wh',2020,'','24020000','/HinhAnh/SP011.jpg');
insert into sanpham values ('','MH018','BXL06','RAM02','CKN15','DM0002','Laptop Asus TUF Gaming FX506HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10 (HN002T)',10,'??en','SSD 512 GB NVMe PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card r???iRTX 3050 4GB','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 305 mm - R???ng 211 mm - D??y 11.9 mm - N???ng 1.3 kg','','4-cell Li-ion, 67 Wh',2021,'','33490000','/HinhAnh/SP012.jpg');
insert into sanpham values ('','MH019','BXL09','RAM02','CKN15','DM0002','Laptop Asus VivoBook X415EA i5 1135G7/8GB/512GB/Win10 (EB637T)',10,'??en','H??? tr??? khe c???m HDD SATASSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL + Office H&S 2019 v??nh vi???n','V??? nh???a','D??i 325.4 mm - R???ng 216 mm - D??y 19.9 mm - N???ng 1.55 kg','','2-cell Li-ion, 37 Wh',2020,'','45020000','/HinhAnh/SP013.jpg');
insert into sanpham values ('','MH002','BXL16','RAM26','CKN17','DM0002','Laptop Asus VivoBook X515EA i3 1115G4/4GB/256GB/Win10 (BQ994T) ',10,'??en','H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB)256 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???pIntel UHD','','Windows 10 Home SL','V??? nh???a','D??i 360.2 mm - R???ng 234.9 mm - D??y 19.9 mm - N???ng 1.8 kg','','2-cell Li-ion, 37 Wh',2020,'','49000000','/HinhAnh/SP014.jpg');
insert into sanpham values ('','MH015','BXL10','RAM12','CKN18','DM0003','Laptop HP Envy 13 ba1030TU i7 1165G7/8GB/512GB/Office H&S2019/Win10 (2K0B6PA)',10,'X??m','SSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL + Office H&S 2019 v??nh vi???n','V??? kim lo???i nguy??n kh???i','D??i 306.5 mm - R???ng 194.6 mm - D??y 16.9 mm - N???ng 1.236 kg','','3 cell Lion',2020,'','30490000','/HinhAnh/SP015.jpg');
insert into sanpham values ('','MH010','BXL18','RAM14','CKN13','DM0003','Laptop HP Gaming VICTUS 16 e0175AX R5 5600H/8GB/512GB/4GB RTX3050/144Hz/Win10 (4R0U8PA)',10,'X??m','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)Kh??ng h??? tr??? khe c???m HDD','Card r???iRTX 3050 4GB','','Windows 10 Home SL','V??? nh???a','D??i 370 mm - R???ng 260 mm - D??y 23.5 mm - N???ng 2.46 kg','','2-cell Li-ion, 37 Wh',2020,'','24290000','/HinhAnh/SP016.jpg');
insert into sanpham values ('','MH017','BXL10','RAM18','CKN25','DM0003','Laptop HP Omen 15 ek0078TX i7 10750H/16GB/1TB SSD/8GB RTX2070 Max-Q/300Hz/Office H&S2019/Win10 (26Y68PA)',10,'??en','1 TB SSD M.2 PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card r???iRTX 2070 Max-Q 8GB','','Windows 10 Home SL + Office H&S 2019 v??nh vi???n','Kim loa??i va?? polycarbonate','D??i 357.9 mm - R???ng 239.7 mm - D??y 22.5 mm - N???ng 2.36 kg','','6-cell Li-ion, 70.9 Wh',2021,'','50490000','/HinhAnh/SP017.jpg');
insert into sanpham values ('','MH017','BXL10','RAM19','CKN25','DM0003','Laptop HP EliteBook X360 1030 G8 i7 1165G7/16GB/512GB/Touch/Pen/Win10 Pro (3G1C4PA)',3,'??en','SSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Pro','V??? kim lo???i nguy??n kh???i','D??i 303.7 mm - R???ng 193.9 mm - D??y 16.1 mm - N???ng 1.25 kg','','4-cell Li-ion, 54 Wh',2021,'','49090000','/HinhAnh/SP018.jpg');
insert into sanpham values ('','MH018','BXL17','RAM27','CKN25','DM0003','Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10 (46M02PA)',5,'??en','SSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','N???p l??ng v?? chi???u ngh??? tay b???ng kim lo???i','D??i 360.2 mm - R???ng 234 mm - D??y 17.9 mm - N???ng 1.677 kg','','2-cell Li-ion, 37 Wh',2020,'','18790000','/HinhAnh/SP019.jpg');
insert into sanpham values ('','MH017','BXL17','RAM27','CKN25','DM0003','Laptop HP Pavilion 15 eg0505TU i5 1135G7/8GB/512GB/Win10 (46M02PB)',3,'X??m','SSD 512 GB NVMe PCIe','Card t??ch h???pIntel Iris Xe','','Windows 10 Home SL','N???p l??ng v?? chi???u ngh??? tay b???ng kim lo???i','D??i 360.2 mm - R???ng 234 mm - D??y 17.9 mm - N???ng 1.677 kg','','2-cell Li-ion, 37 Wh',2020,'','18790000','/HinhAnh/SP020.jpg');
insert into sanpham values ('','MH013','BXL05','RAM09','CKN12','DM0004','Laptop Lenovo Yoga 9 14ITL5 i7/1185G7/16GB/1TB SSD/Touch/Pen/Win10 (82BG006EVN)',5,'x??m','1 TB SSD M.2 PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 319.4 mm - R???ng 216.4 mm - D??y 15.7 mm - N???ng 1.37 kg',' ','Li-Polymer, 60 Wh',2021,'','29990000','/HinhAnh/SP021.jpg');
insert into sanpham values ('','MH014','BXL10','RAM10','CKN13','DM0004','Laptop Lenovo Yoga Duet 7 13IML05 i7 10510U/8GB/512GB/Touch/Pen/Win10 (82AS007CVN)',4,'??en','SSD 512 GB NVMe PCIe','Card t??ch h???p - Intel UHD Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 297.4 mm - R???ng 207.4 mm - D??y 9.19 mm - N???ng 1.1683 kg',' ','Li-Polymer, 42 Wh',2020,'','29990000','/HinhAnh/SP022.jpg');
insert into sanpham values ('','MH015','BXL11','RAM07','CKN14','DM0004','Laptop Lenovo YOGA Slim 7 Carbon 13ITL5 i5 1135G7/16GB/512GB/Win10 (82EV0016VN)',4,'tr???ng','SSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','M???t l??ng Carbon - Chi???u ngh??? tay b???ng Nh??m Magie','D??i 295.88 mm - R???ng 208.85 mm - D??y 15 mm - N???ng 0.966 kg',' ','Li-Polymer, 50 Wh',2020,'','28990000','/HinhAnh/SP023.jpg');
insert into sanpham values ('','MH016','BXL07','RAM11','CKN15','DM0004','Laptop Lenovo Yoga 7 14ITL5 i7 1165G7/8GB/512GB/Touch/Pen/Win10 (82BH00CKVN)',4,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 320.4 mm - R???ng 214.6 mm - D??y 17.7 mm - N???ng 1.43 kg',' ','71 Wh',2020,'','28990000','/HinhAnh/SP024.jpg');
insert into sanpham values ('','MH016','BXL07','RAM12','CKN16','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i7 1165G7/8GB/512GB/Touch/Pen/Win10 (20WE004EVN)',5,'x??m','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 320 mm - R???ng 216 mm - D??y 16.9 mm - N???ng 1.5 kg',' ','60 Wh',2021,'','27890000','/HinhAnh/SP025.jpg');
insert into sanpham values ('','MH014','BXL12','RAM10','CKN13','DM0004','Laptop Lenovo Yoga Duet 7 13IML05 i5 10210U/8GB/512GB/Touch/Pen/Win10 (82AS007BVN)',5,'??en','SSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 297.4 mm - R???ng 207.4 mm - D??y 9.19 mm - N???ng 1.1683 kg',' ','Li-Polymer, 42 Wh',2020,'','26990000','/HinhAnh/SP026.jpg');
insert into sanpham values ('','MH017','BXL06','RAM13','CKN17','DM0004','Laptop Lenovo Ideapad Gaming 3 15IMH005 i7 10750H/8GB/512GB/4GB GTX1650Ti/120Hz/Win10 (81Y4013UVN)',3,'xanh ??en','SSD 512 GB NVMe PCIe, H??? tr??? khe c???m HDD SATA','Card r???i - NVIDIA GeForce GTX 1650Ti 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 359 mm - R???ng 249.6 mm - D??y 24.9 mm - N???ng 2.2 kg',' ','45 Wh',2020,'','26990000','/HinhAnh/SP027.jpg');
insert into sanpham values ('','MH016','BXL11','RAM14','CKN18','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i5 1135G7/16GB/512GB/Touch/Pen/Win10 (20WE004DVN)',3,'x??m','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB) 512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 320 mm - R???ng 216 mm - D??y 16.9 mm - N???ng 1.5 kg',' ','60 Wh',2021,'','25890000','/HinhAnh/SP028.jpg');
insert into sanpham values ('','MH016','BXL11','RAM12','CKN18','DM0004','Laptop Lenovo ThinkBook 14s Yoga ITL i5 1135G7/8GB/512GB/Touch/Pen/Win10 (20WE004CVN)',3,'x??m','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 320 mm - R???ng 216 mm - D??y 16.9 mm - N???ng 1.5 kg','  ','60 Wh',2021,'','24790000','/HinhAnh/SP029.jpg');
insert into sanpham values ('','MH016','BXL07','RAM12','CKN19','DM0004','Laptop Lenovo ThinkBook 14 G2 ITL i7 1165G7/8GB/512GB/Win10 (20VD003LVN)',4,'x??m','H??? tr??? khe c???m HDD SATA SSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 323 mm - R???ng 218 mm - D??y 17.9 mm - N???ng 1.4 kg',' ','45 Wh',2020,'','21990000','/HinhAnh/SP030.jpg');
insert into sanpham values ('','MH020','BXL08','RAM20','CKN20','DM0005','Laptop Acer Nitro 5 Gaming AN515 57 54AF i5 11400H/16GB/512GB/4GB RTX3050/144Hz/Win11 (NH.QENSV.004)',4,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB)H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 363.4 mm - R???ng 255 mm - D??y 23.9 mm - N???ng 2.2 kg',' ','4-cell Li-ion, 57 Wh',2021,'','28990000','/HinhAnh/SP031.jpg');
insert into sanpham values ('','MH018','BXL13','RAM16','CKN21','DM0005','Laptop Acer Aspire A315 56 308N i3 1005G1/4GB/256GB/Win10 (NX.HS5SV.00C)',4,'??en','SSD 256 GB NVMe PCIeH??? tr??? khe c???m HDD SATA','Card t??ch h???p - Intel UHD Graphics','','Windows 10 Home SL','V??? nh???a','D??i 363.4 mm - R???ng 247.5 mm - D??y 19.9 mm - N???ng 1.7 kg                        ',' ','2-Cell Li-ion',2020,'','11790000','/HinhAnh/SP032.jpg');
insert into sanpham values ('','MH020','BXL03','RAM15','CKN09','DM0005','Laptop Acer Predator Helios PH315 54 78W5 i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Balo/Win10 (NH.QC5SV.001)',4,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB), H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB), H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 363 mm - R???ng 255 mm - D??y 22.9 mm - N???ng 2.3 kg',' ','4-cell Li-ion, 57 Wh',2021,'','32990000','/HinhAnh/SP033.jpg');
insert into sanpham values ('','MH020','BXL03','RAM15','CKN20','DM0005','Laptop Acer Nitro 5 Gaming AN515 57 727J i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10 (NH.QD9SV.005.)',4,'??en','H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB)H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 363.4 mm - R???ng 255 mm - D??y 23.9 mm - N???ng 2.2 kg',' ','4-cell Li-ion, 57 Wh',2021,'','29990000','/HinhAnh/SP034.jpg');
insert into sanpham values ('','MH022','BXL03','RAM20','CKN24','DM0005','Laptop Acer Predator Triton 300 PT315 53 71DJ i7 11800H/16GB/512GB/8GB RTX3070/165Hz/Win10 (NH.QDSSV.001)',4,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','V??? kim lo???i','D??i 353 mm - R???ng 255 mm - D??y 19.9 mm - N???ng 2 kg',' ','4-cell Li-ion, 59 Wh',2021,'','44990000','/HinhAnh/SP035.jpg');
insert into sanpham values ('','MH019','BXL11','RAM17 ','CKN22','DM0006','Laptop Dell Vostro 3400 i5 1135G7/8GB/256GB//OfficeH&S 2019/Win10 (70253900)',4,'??en','SSD 256 GB NVMe PCIe, H??? tr??? khe c???m HDD SATA','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL + Office Home & Student 2019 v??nh vi???n','V??? nh???a','D??i 328.7 mm - R???ng 239.5 mm - D??y 19.9 mm - N???ng 1.64 kg',' ','3-cell Li-ion, 42 Wh',2021,'','18890000','/HinhAnh/SP036.jpg');
insert into sanpham values ('','MH018','BXL11','RAM18','CKN22','DM0006','Laptop Dell Vostro 3500 i5 1135G7/8GB/512GB/Office H&S2019/Win10 (7G3983)',5,'??en','SSD 512 GB NVMe PCIeH??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL + Office Home & Student 2019 v??nh vi???n','V??? nh???a','D??i 364 mm - R???ng 249 mm - D??y 19.9 mm - N???ng 1.98 kg',' ','3-cell Li-ion, 42 Wh',2021,'','20990000','/HinhAnh/SP037.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002BWH)',3,'tr???ng','SSD 512 GB NVMe PCIe H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card r???i - NVIDIA GeForce GTX 1660Ti, 6 GB','','windowns 10 Home SL','V??? nh???a','D??i 364.46 mm - R???ng 254 mm - D??y 30.96 mm - N???ng 2.58 kg',' ','4-cell Li-ion, 68 Wh',2020,'','31990000','/HinhAnh/SP038.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 i7 10750H/16GB/512GB/6GB GTX1660Ti/120Hz/Win10 (P89F002G3500B)',6,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ngSSD 512 GB NVMe PCIe','Card r???i - NVIDIA GeForce GTX 1660Ti, 6 GB','','Windows 10 Home SL','V??? nh???a','D??i 364.46 mm - R???ng 254 mm - D??y 30.96 mm - N???ng 2.58 kg',' ','4-cell Li-ion, 68 Wh',2020,'','31990000','/HinhAnh/SP039.jpg');
insert into sanpham values ('','MH021','BXL06','RAM19','CKN23','DM0006','Laptop Dell Gaming G3 15 i7 10750H/16GB/512GB/4GB GTX1650Ti/120Hz/Win10 (P89F002DBL)',5,'??en','H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB) SSD 512 GB NVMe PCIe','Card r???i - NVIDIA GeForce GTX 1650Ti 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 364.46 mm - R???ng 254 mm - D??y 30.96 mm - N???ng 2.58 kg',' ','3-cell Li-ion, 51 Wh',2020,'','29990000','/HinhAnh/SP040.jpg');
insert into sanpham values ('','MH001','BXL01','RAM01','CKN01','DM0007','Laptop MSI Gaming GF65 Thin 10UE i5 10500H/16GB/512GB/6GB RTX3060 Max-Q/144Hz/Balo/Win10 (286VN)',5,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 2TB)H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 2TB)','Card r???i - NVIDIA GeForce RTX 3060 Max-Q, 6 GB','','Windows 10 Home SL','V??? nh???a','D??i 359 mm - R???ng 254 mm - D??y 21.7 mm - N???ng 1.86 kg','','3-cell, 52 Wh',2021,'','18990000','/HinhAnh/SP041.png');
insert into sanpham values ('','MH002','BXL02','RAM02','CKN02','DM0007','Laptop MSI Modern 15 A11MU i5 1155G7/8GB/512GB/T??i/Chu???t/Win10 (680VN)',5,'X??m','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 2TB)512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 2TB)','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i','D??i 356.8 mm - R???ng 233.75 mm - D??y 16.9 mm - N???ng 1.6 kg','','4-cell, 99.9 Wh',2021,'','79990000','/HinhAnh/SP042.png');
insert into sanpham values ('','MH003','BXL03','RAM03','CKN03','DM0007','Laptop MSI Gaming GE66 Raider 11UH i7 11800H/32GB/2TB SSD/16GB RTX3080/240Hz/Balo/Chu???t/Win10 (259VN)',4,'X??m','2 TB SSD NVMe PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 2TB)','Card r???i - NVIDIA GeForce RTX 3080, 16 GB','','Windows 10 Home SL','V??? kim lo???i','D??i 358 mm - R???ng 267 mm - D??y 23.4 mm - N???ng 2.38 Kg','','4-cell, 99.9 Wh',2021,'','64990000','/HinhAnh/SP043.png');
insert into sanpham values ('','MH004','BXL03','RAM03','CKN04','DM0007','Laptop MSI Gaming GS66 Stealth 11UG i7 11800H/32GB/2TB SSD/8GB RTX3070 Max-Q/360Hz/Balo/Chu???t/Win10 (219VN)',3,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 2TB)2 TB SSD NVMe PCIe','Card r???i - NVIDIA GeForce RTX 3070 Max-Q, 8 GB','','Windows 10 Home SL','V??? kim lo???i','D??i 358.3 mm - R???ng 248 mm - D??y 19.8 mm - N???ng 2.1 Kg','','4-cell, 99.9 Wh',2021,'','59990000','/HinhAnh/SP044.png');
insert into sanpham values ('','MH004','BXL03','RAM01','CKN05','DM0007','Laptop MSI Gaming GE66 Raider 11UG i7 11800H/16GB/2TB SSD/8GB RTX3070/360Hz/Balo/Chu???t/Win10 (258VN) ',3,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 2TB)2 TB SSD NVMe PCIe','Card r???i - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','V??? kim lo???i','D??i 358 mm - R???ng 267 mm - D??y 23.4 mm - N???ng 2.38 Kg','','4-cell Li-ion, 65 Wh',2021,'','52990000','/HinhAnh/SP045.png');
insert into sanpham values ('','MH005','BXL03','RAM01','CKN06','DM0007','Laptop MSI Gaming GP76 11UG i7 11800H/16GB/1TB SSD/8GB RTX3070/240Hz/Balo/Chu???t/Win10 (435VN)',2,'??en','1 TB SSD M.2 PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card r???i - NVIDIA GeForce RTX 3070, 8 GB','','Windows 10 Home SL','V??? kim lo???i','D??i 397 mm - R???ng 284 mm - D??y 25.9 mm - N???ng 2.9 kg','','4-cell, 82Wh',2021,'','46490000','/HinhAnh/SP046.png');
insert into sanpham values ('','MH006','BXL04','RAM04','CKN07','DM0007','Laptop MSI Summit E16 Flip i7 1195G7/16GB/1TB SSD/4GB RTX3050/120Hz/Touch/Pen/T??i/Office365F/Win10 (082VN) ',3,'??en','1 TB SSD M.2 PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 2TB)','Card r???i - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL + Office 365 Family 1 n??m','V??? kim lo???i','D??i 358.2 mm - R???ng 258.5 mm - D??y 16.9 mm - N???ng 1.9 kg','','4-cell Li-ion, 70 Wh',2021,'','39990000','/HinhAnh/SP047.png');
insert into sanpham values ('','MH007','BXL05','RAM05','CKN08','DM0007','Laptop MSI Summit E13 Flip i7 1185G7/16GB/1TB SSD/Touch/T??i/Pen/Win10 (211VN)',3,'??en','SSD 1 TB NVMe PCIe Gen4x4','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home SL','V??? kim lo???i nguy??n kh???i','D??i 300.2 mm - R???ng 222.25 mm - D??y 14.9 mm - N???ng 1.35 kg','','6-cell Li-ion',2020,'','32490000','/HinhAnh/SP048.png');
insert into sanpham values ('','MH008','BXL06','RAM06','CKN09','DM0007','Laptop MSI Gaming Leopard 10SDK GL65 i7 10750H/16GB/512GB/144Hz/6GB GTX1660Ti/Balo/Win10 (242VN)',3,'??en','SSD 512 GB NVMe PCIeH??? tr??? khe c???m HDD SATA','Card r???i - NVIDIA GeForce GTX 1660Ti, 6 GB','','Windows 10 Home SL','V??? nh???a','D??i 359 mm - R???ng 254 mm - D??y 21.7 mm - N???ng 2.3 kg','','3-cell Li-ion, 51 Wh',2021,'','31990000','/HinhAnh/SP049.png');
insert into sanpham values ('','MH009','BXL06','RAM01','CKN01','DM0007','Laptop MSI Gaming GF65 10UE i7 10750H/16GB/512GB/6GB RTX3060 Max-Q/Balo/Win10 (228VN) ',3,'??en','SSD 512 GB NVMe PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card r???i - NVIDIA GeForce RTX 3060 Max-Q, 6 GB','','Windows 10 Home SL','V??? nh???a - n???p l??ng b???ng kim lo???i','D??i 359 mm - R???ng 254 mm - D??y 21.7 mm - N???ng 1.86 kg','','2-cell Li-ion, 80 Wh',2020,'','54890000','/HinhAnh/SP050.png');
insert into sanpham values ('','MH010','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 17 2021 i7 1165G7/16GB/1TB SSD/Win10 (17Z90P-G.AH78A5) ',3,'??en','1 TB SSD M.2 PCIeH??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home Standard','H???p kim Nano Carbon - Magie','D??i 380.2 mm - R???ng 260.1 mm - D??y 17.8 mm - N???ng 1.35 kg','','2-cell Li-ion, 80 Wh',2020,'','52890000','/HinhAnh/SP051.png');
insert into sanpham values ('','MH010','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 17 2021 i7 1165G7/16GB/512GB/Win10 (17Z90P-G.AH76A5) ',3,'B???c','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ngSSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home Standard','H???p kim Nano Carbon - Magie','D??i 380.2 mm - R???ng 260.1 mm - D??y 17.8 mm - N???ng 1.35 kg','','2-cell Li-ion, 80 Wh',2020,'','50890000','/HinhAnh/SP052.png');
insert into sanpham values ('','MH011','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 16 2021 i7 1165G7/16GB/512GB/Win10 (16Z90P-G.AH75A5)',3,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ngSSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home Standard','H???p kim Nano Carbon - Magie','D??i 355.9 mm - R???ng 243.4 mm - D??y 16.8 mm - N???ng 1.19 kg','','2-cell Li-ion, 80 Wh',2020,'','48890000','/HinhAnh/SP053.png');
insert into sanpham values ('','MH011','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 16 2021 i7 1165G7/16GB/256GB/Win10 (16Z90P-G.AH73A5) ',3,'B???c','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ngSSD 256 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home Standard','H???p kim Nano Carbon - Magie','D??i 355.9 mm - R???ng 243.4 mm - D??y 16.8 mm - N???ng 1.19 kg','','4-cell Li-ion, 72 Wh',2021,'','47890000','/HinhAnh/SP054.png');
insert into sanpham values ('','MH012','BXL07','RAM07','CKN10','DM0008','Laptop LG Gram 14 2021 i7 1165G7/16GB/512GB/Win 10 (14Z90P-G.AH75A5)',3,'??en','H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ngSSD 512 GB NVMe PCIe','Card t??ch h???p - Intel Iris Xe Graphics','','Windows 10 Home Standard','H???p kim Nano Carbon - Magie','D??i 313.4 mm - R???ng 215.2 mm - D??y 16.8 mm - N???ng 0.999 kg','','4-cell Li-ion, 41 Wh',2021,'','29990000','/HinhAnh/SP055.png');
insert into sanpham values ('','MH001','BXL08','RAM01','CKN11','DM0009','Laptop GIGABYTE Gaming G5 i5 11400H/16GB/512GB/4GB RTX3050Ti/144Hz/Win10 (51S1123SH) ',4,'??en','H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB), H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB), 512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX3050Ti, 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 361 mm - R???ng 258 mm - D??y 24.9 mm - N???ng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','29990000','/HinhAnh/SP056.png');
insert into sanpham values ('','MH001','BXL09','RAM01','CKN11','DM0009','Laptop GIGABYTE Gaming G5 i5 10500H/16GB/512GB/6GB RTX3060/144Hz/Win10 (5S11130SH)',3,'??en','H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB), H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB), 512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX 3060, 6 GB','','Windows 10 Home SL','V??? nh???a','D??i 361 mm - R???ng 258 mm - D??y 24.9 mm - N???ng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','26990000','/HinhAnh/SP057.png');
insert into sanpham values ('','MH001','BXL08','RAM01','CKN11','DM0009','Laptop Gigabyte G5 i5 11400H/16GB/512GB/4GB RTX3050/144Hz/Win10 (51S1121SH)',3,'??en','512 GB SSD NVMe PCIe (C?? th??? th??o ra, l???p thanh kh??c t???i ??a 1TB), H??? tr??? khe c???m HDD SATA (n??ng c???p t???i ??a 2TB), H??? tr??? th??m 1 khe c???m SSD M.2 PCIe m??? r???ng (n??ng c???p t???i ??a 1TB)','Card r???i - NVIDIA GeForce RTX3050, 4 GB','','Windows 10 Home SL','V??? nh???a','D??i 361 mm - R???ng 258 mm - D??y 24.9 mm - N???ng 2.2 kg','','4-cell Li-ion, 41 Wh',2021,'','26990000','/HinhAnh/SP058.png');


