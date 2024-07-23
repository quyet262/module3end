create database quan_ly_xuat_nhap_mnt3;
use quan_ly_xuat_nhap_mnt3;

create table nha_cc
(
    id_ncc  int auto_increment primary key,
    ma_ncc  varchar(50),
    ten_ncc varchar(50),
    dia_chi varchar(255),
    sdt     varchar(10) unique
);
create table vat_tu
(
    id_vat_tu  int auto_increment primary key,
    ma_vat_tu  varchar(50),
    ten_vat_tu varchar(50),
    dv_tinh    varchar(20),
    gia_tien   int
);
create table don_dat_hang
(
    id_don_dh int auto_increment primary key,
    ma_don    varchar(20),
    ngay_dh   date,
    ncc_id    int,
    foreign key (ncc_id) references nha_cc (id_ncc)
);
create table ton_kho
(
    id_tk     int auto_increment primary key,
    vat_tu_id int,
    sl_dau    int,
    tong_sln  int,
    tong_slx  int,
    foreign key (vat_tu_id) references vat_tu (id_vat_tu)
);


create table p_nhap
(
    id_pn     int auto_increment primary key,
    so_pn     varchar(20),
    ngay_nhap date,
    don_dh_id int,
    foreign key (don_dh_id) references don_dat_hang (id_don_dh)
);
create table p_xuat
(
    id_px          int auto_increment primary key,
    so_px          varchar(20),
    ngay_xuat      date,
    ten_khach_hang varchar(50)
);
create table ct_don_dat_hang
(
    id_ct_dh  int auto_increment primary key,
    don_dh_id int,
    vat_tu_id int,
    sl_dat    int,
    foreign key (don_dh_id) references don_dat_hang (id_don_dh),
    foreign key (vat_tu_id) references vat_tu (id_vat_tu)
);
create table ct_p_nhap
(
    id_ct_pn     int auto_increment primary key,
    pn_id        int,
    vat_tu_id    int,
    sl_nhap      int,
    don_gia_nhap int,
    ghi_chu      varchar(255),
    foreign key (pn_id) references p_nhap (id_pn),
    foreign key (vat_tu_id) references vat_tu (id_vat_tu)
);
create table ct_p_xuat
(
    id_ct_px     int auto_increment primary key,
    px_id        int,
    vat_tu_id    int,
    sl_xuat      int,
    don_gia_xuat int,
    ghi_chu      varchar(255),
    foreign key (px_id) references p_xuat (id_px),
    foreign key (vat_tu_id) references vat_tu (id_vat_tu)
);

INSERT INTO nha_cc (ma_ncc, ten_ncc, dia_chi, sdt)
VALUES ('NCC001', 'Công ty ABC', '123 Đường A, Quận 1, TP.HCM', '0901234567'),
       ('NCC002', 'Công ty XYZ', '456 Đường B, Quận 2, TP.HCM', '0902345678'),
       ('NCC003', 'Công ty DEF', '789 Đường C, Quận 3, TP.HCM', '0903456789');


INSERT INTO don_dat_hang (ma_don, ngay_dh, ncc_id)
VALUES ('DH001', '2024-01-15', 1),
       ('DH002', '2024-02-20', 2),
       ('DH003', '2024-03-25', 3);


INSERT INTO p_nhap (so_pn, ngay_nhap, don_dh_id)
VALUES ('PN001', '2024-01-16', 1),
       ('PN002', '2024-02-21', 2),
       ('PN003', '2024-03-26', 3);


INSERT INTO p_xuat (so_px, ngay_xuat, ten_khach_hang)
VALUES ('PX001', '2024-01-17', 'Khách hàng A'),
       ('PX002', '2024-02-22', 'Khách hàng B'),
       ('PX003', '2024-03-27', 'Khách hàng C');


INSERT INTO vat_tu (ma_vat_tu, ten_vat_tu, dv_tinh, gia_tien)
VALUES ('VT001', 'Vật tư A', 'kg', 1000),
       ('VT002', 'Vật tư B', 'kg', 1500),
       ('VT003', 'Vật tư C', 'kg', 2000),
       ('VT004', 'Vật tư D', 'kg', 2500),
       ('VT005', 'Vật tư E', 'kg', 3000),
       ('VT006', 'Vật tư F', 'kg', 3500),
       ('VT007', 'Vật tư G', 'kg', 4000),
       ('VT008', 'Vật tư H', 'kg', 4500),
       ('VT009', 'Vật tư I', 'kg', 5000),
       ('VT010', 'Vật tư J', 'kg', 5500);


INSERT INTO ct_don_dat_hang (don_dh_id, vat_tu_id, sl_dat)
VALUES (1, 1, 50),
       (1, 2, 30),
       (2, 3, 20),
       (2, 4, 40),
       (3, 5, 25),
       (3, 6, 35);


INSERT INTO ct_p_nhap (pn_id, vat_tu_id, sl_nhap, don_gia_nhap, ghi_chu)
VALUES (1, 1, 50, 1000, 'Hàng mới về'),
       (1, 2, 30, 1500, 'Hàng mới về'),
       (2, 3, 20, 2000, 'Hàng mới về'),
       (2, 4, 40, 2500, 'Hàng mới về'),
       (3, 5, 25, 3000, 'Hàng mới về'),
       (3, 6, 35, 3500, 'Hàng mới về');


INSERT INTO ct_p_xuat (px_id, vat_tu_id, sl_xuat, don_gia_xuat, ghi_chu)
VALUES (1, 1, 10, 1100, 'Xuất cho KH A'),
       (1, 2, 15, 1600, 'Xuất cho KH A'),
       (2, 3, 5, 2100, 'Xuất cho KH B'),
       (2, 4, 10, 2600, 'Xuất cho KH B'),
       (3, 5, 12, 3100, 'Xuất cho KH C'),
       (3, 6, 20, 3600, 'Xuất cho KH C');



INSERT INTO ton_kho (vat_tu_id, sl_dau, tong_sln, tong_slx)
VALUES (1, 100, 50, 10),
       (2, 80, 30, 15),
       (3, 60, 20, 5),
       (4, 90, 40, 10),
       (5, 70, 25, 12);
CREATE VIEW vw_CTPNHAP AS
SELECT p_nhap.so_pn                                 AS so_phieu_nhap_hang,
       vat_tu.ma_vat_tu                             AS ma_vat_tu,
       ct_p_nhap.sl_nhap                            AS so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       AS don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) AS thanh_tien_nhap
FROM ct_p_nhap
         JOIN
     p_nhap ON ct_p_nhap.pn_id = p_nhap.id_pn
         JOIN
     vat_tu ON ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu;
create view vw_ctpnhap_vt as
select p_nhap.so_pn                                 as so_phieu_nhap_hang,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       vat_tu.ten_vat_tu                            as ten_vat_tu,
       ct_p_nhap.sl_nhap                            as so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       as don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) as thanh_tien_nhap
from ct_p_nhap
         join
     p_nhap on ct_p_nhap.pn_id = p_nhap.id_pn
         join
     vat_tu on ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu;
create view vw_ctpnhap_vt_pn as
select p_nhap.so_pn                                 as so_phieu_nhap_hang,
       p_nhap.ngay_nhap                             as ngay_nhap_hang,
       ct_don_dat_hang.sl_dat                       as so_don_dat_hang,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       vat_tu.ten_vat_tu                            as ten_vat_tu,
       ct_p_nhap.sl_nhap                            as so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       as don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) as thanh_tien_nhap
from ct_p_nhap
         join p_nhap on ct_p_nhap.pn_id = p_nhap.id_pn
         join vat_tu on ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu
         join ct_don_dat_hang on vat_tu.id_vat_tu = ct_don_dat_hang.vat_tu_id;

create view vw_ctpnhap_vt_pn_dh as
select p_nhap.so_pn                                 as so_phieu_nhap_hang,
       p_nhap.ngay_nhap                             as ngay_nhap_hang,
       ct_don_dat_hang.sl_dat                       as so_don_dat_hang,
       nha_cc.ma_ncc                                as ma_nha_cung_cap,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       vat_tu.ten_vat_tu                            as ten_vat_tu,
       ct_p_nhap.sl_nhap                            as so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       as don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) as thanh_tien_nhap
from ct_p_nhap
         join p_nhap on ct_p_nhap.pn_id = p_nhap.id_pn
         join vat_tu on ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu
         join ct_don_dat_hang on vat_tu.id_vat_tu = ct_don_dat_hang.vat_tu_id
         join don_dat_hang on ct_don_dat_hang.don_dh_id = don_dat_hang.id_don_dh
         join nha_cc on don_dat_hang.ncc_id = nha_cc.id_ncc;
create view vw_ctpnhap_loc as
select p_nhap.so_pn                                 as so_phieu_nhap_hang,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       ct_p_nhap.sl_nhap                            as so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       as don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) as thanh_tien_nhap
from p_nhap
         join ct_p_nhap on p_nhap.id_pn = ct_p_nhap.pn_id
         join vat_tu on ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu
having so_luong_nhap > 5;
create view vw_ctpnhap_vt_loc as
select p_nhap.so_pn                                 as so_phieu_nhap_hang,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       vat_tu.ten_vat_tu                            as ten_vat_tu,
       ct_p_nhap.sl_nhap                            as so_luong_nhap,
       ct_p_nhap.don_gia_nhap                       as don_gia_nhap,
       (ct_p_nhap.sl_nhap * ct_p_nhap.don_gia_nhap) as thanh_tien_nhap
from p_nhap
         join ct_p_nhap on p_nhap.id_pn = ct_p_nhap.pn_id
         join vat_tu on ct_p_nhap.vat_tu_id = vat_tu.id_vat_tu
where vat_tu.dv_tinh like 'Bộ';

create view vw_ctpxuat as
select p_xuat.id_px                                 as so_phieu_xuat,
       vat_tu.ma_vat_tu                             as ma_vat_tu,
       ct_p_xuat.sl_xuat                            as so_luong_xuat,
       ct_p_xuat.don_gia_xuat                       as don_gia_xuat,
       (ct_p_xuat.sl_xuat * ct_p_xuat.don_gia_xuat) as thanh_tien_xuat
from p_xuat
         join ct_p_xuat on p_xuat.id_px = ct_p_xuat.px_id
         join vat_tu on ct_p_xuat.vat_tu_id = vat_tu.id_vat_tu;
create view vw_ctpxuat_vt_px as
select p_xuat.id_px           as so_phieu_xuat,
       vat_tu.ma_vat_tu       as ma_vat_tu,
       vat_tu.ten_vat_tu      as ten_vat_tu,
       ct_p_xuat.sl_xuat      as so_luong_xuat,
       ct_p_xuat.don_gia_xuat as don_gia_xuat
from p_xuat
         join ct_p_xuat on p_xuat.id_px = ct_p_xuat.px_id
         join vat_tu on ct_p_xuat.vat_tu_id = vat_tu.id_vat_tu;
create view vw_ctpxuat_vt_px as
select p_xuat.id_px           as so_phieu_xuat_hang,
       p_xuat.ten_khach_hang  as ten_khach_hang,
       vat_tu.ma_vat_tu       as ma_vat_tu,
       vat_tu.ten_vat_tu      as ten_vat_tu,
       ct_p_xuat.sl_xuat      as so_luong_xuat,
       ct_p_xuat.don_gia_xuat as don_gia_xuat
from p_xuat
         join ct_p_xuat on p_xuat.id_px = ct_p_xuat.px_id
         join vat_tu on ct_p_xuat.vat_tu_id = vat_tu.id_vat_tu;
select *
from p_xuat;
show tables;
DESCRIBE p_xuat;
DELIMITER //

CREATE PROCEDURE get_total_quantity(IN ma_vat_tu_param VARCHAR(50), OUT total_quantity INT)
BEGIN
    DECLARE vat_tu_id INT;

    -- Lấy id_vat_tu từ ma_vat_tu
    SELECT id_vat_tu
    INTO vat_tu_id
    FROM vat_tu
    WHERE ma_vat_tu = ma_vat_tu_param;

    -- Tính tổng số lượng tồn kho cuối
    IF vat_tu_id IS NOT NULL THEN
        SELECT sl_dau + tong_sln - tong_slx
        INTO total_quantity
        FROM ton_kho
        WHERE vat_tu_id = vat_tu_id;
    ELSE
        SET total_quantity = NULL;
    END IF;
END //

DELIMITER ;
create index idx_ten_vat_tu on vat_tu (ten_vat_tu);
DELIMITER //
CREATE PROCEDURE sp_tong_so_luong_cuoi_vat_tu(IN maVatTu VARCHAR(50))
BEGIN
    SELECT t.vat_tu_id, v.ma_vat_tu, v.ten_vat_tu, (t.sl_dau + t.tong_sln - t.tong_slx) AS tong_sl_cuoi
    FROM ton_kho t
             JOIN vat_tu v ON t.vat_tu_id = v.id_vat_tu
    WHERE v.ma_vat_tu = maVatTu;
END //
DELIMITER ;
delimiter //
create procedure tong_tien_xuat_vat_tu(in mavattu varchar(50))
begin
    select ma_vat_tu,
           ten_vat_tu,
           sum(sl_xuat * ct_p_xuat.don_gia_xuat) as tong_tien_xuat
    from ct_p_xuat
             join vat_tu on ct_p_xuat.vat_tu_id = vat_tu.id_vat_tu
    where ma_vat_tu = mavattu
    group by ma_vat_tu, ten_vat_tu;
end //
delimiter ;

DELIMITER //
CREATE PROCEDURE sp_tong_tien_xuat_vat_tu_demo1(
    IN maVatTu VARCHAR(50),
    OUT maVatTuOut VARCHAR(50),
    OUT tenVatTuOut VARCHAR(50),
    OUT tongTienXuat INT
)
BEGIN
    SELECT v.ma_vat_tu,
           v.ten_vat_tu,
           SUM(cpx.sl_xuat * cpx.don_gia_xuat)
    INTO
        maVatTuOut,
        tenVatTuOut,
        tongTienXuat
    FROM ct_p_xuat cpx
             JOIN vat_tu v ON cpx.vat_tu_id = v.id_vat_tu
    WHERE v.ma_vat_tu = maVatTu;

    IF tongTienXuat IS NULL THEN
        SET tongTienXuat = 0;
    END IF;
END //
DELIMITER ;
-- Khai báo các biến để nhận giá trị OUT
SET @maVatTuOut = '';
SET @tenVatTuOut = '';
SET @tongTienXuat = 0;
-- Gọi Stored Procedure với mã vật tư và các biến OUT
CALL sp_tong_tien_xuat_vat_tu_demo('VT001', @maVatTuOut, @tenVatTuOut, @tongTienXuat);
-- Xem giá trị của các biến OUT
SELECT @maVatTuOut AS maVatTu, @tenVatTuOut AS tenVatTu, @tongTienXuat AS tongTienXuat;
delimiter //
create procedure tong_so_luong_dat_theo_dh(in sodonhang varchar(50),
                                           out madon varchar(50),
                                           tongsoluongdat int)
begin
    select don_dat_hang.ma_don as ma_don,
           ct_don_dat_hang.sl_dat as tong_sl_dat
        into
            madon,
            tongsoluongdat
    from ct_don_dat_hang
        join don_dat_hang on ct_don_dat_hang.don_dh_id = don_dat_hang.id_don_dh
    where don_dat_hang.ma_don = sodonhang;
end //
delimiter ;
delimiter //
create procedure 1tong_so_luong_dat_theo_dh(in sodonhang varchar(50),
                                           out madon varchar(50),
                                           tongsoluongdat int)
begin
    select don_dat_hang.ma_don as ma_don,
          sum( ct_don_dat_hang.sl_dat) as tong_sl_dat
    into
        madon,
        tongsoluongdat
    from ct_don_dat_hang
             join don_dat_hang on ct_don_dat_hang.don_dh_id = don_dat_hang.id_don_dh
    where don_dat_hang.ma_don = sodonhang
    group by
        don_dat_hang.ma_don;
end //
delimiter ;

set @madon = '';
set @tongsoluongdat = 0;
call 1tong_so_luong_dat_theo_dh('DH001',@madon,@tongsoluongdat);
select @madon as madon, @tongsoluongdat as tong_so_luong_dat;


















