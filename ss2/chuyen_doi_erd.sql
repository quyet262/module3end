/*
1.phieu_xuat
 -so_px (int, primary key)
 -ngay_xuat (date)
2.phieu_nhap
 -so_pn (int, primary key)
 -ngay_nhap (date)

3.nha_cc
 -ma_ncc (int, primary key)
 -ten_ncc (varchar)
 -dia_chi_ncc (varchar)

4.sdt_ncc
 -id (int, primary key)
 -ma_ncc (int, foreign key references nha_cc(ma_ncc))
 -sdt (varchar)

5.don_dh
 -so_dh (int, primary key)
 -ngay_dh (date)
 -ma_ncc (int, foreign key references nha_cc(ma_ncc))

6.vat_tu
 -ma_vt (int, primary key)
 -ten_vt (varchar)

7.chi_tiet_phieu_xuat
 -id (int)
 -dg_xuat (float)
 -sl_xuat (int)
 -so_px (int, foreign key references phieu_xuat(so_px))
 -ma_vt (int, foreign key references vat_tu(ma_vt))
 -primary key (id, so_px, ma_vt)

8.chi_tiet_phieu_nhap
 -id (int)
 -dg_nhap (float)
 -sl_nhap (int)
 -so_pn (int, foreign key references phieu_nhap(so_pn))
 -ma_vt (int, foreign key references vat_tu(ma_vt))
 -primary key (id, so_pn, ma_vt)

9.chi_tiet_don_dh
 -id (int, primary key)
 -ma_vt (int, foreign key references vat_tu(ma_vt))
 -so_dh (int, foreign key references don_dh(so_dh))
 -sl_dh (int)
 */
 create database cua_hang;
use cua_hang;
CREATE TABLE phieu_xuat (
                            so_px INT PRIMARY KEY,
                            ngay_xuat DATE
);

CREATE TABLE phieu_nhap (
                            so_pn INT PRIMARY KEY,
                            ngay_nhap DATE
);

CREATE TABLE nha_cc (
                        ma_ncc INT PRIMARY KEY,
                        ten_ncc VARCHAR(255),
                        dia_chi_ncc VARCHAR(255)
);

CREATE TABLE sdt_ncc (
                         id INT PRIMARY KEY,
                         ma_ncc INT,
                         sdt VARCHAR(15),
                         FOREIGN KEY (ma_ncc) REFERENCES nha_cc(ma_ncc)
);

CREATE TABLE don_dh (
                        so_dh INT PRIMARY KEY,
                        ngay_dh DATE,
                        ma_ncc INT,
                        FOREIGN KEY (ma_ncc) REFERENCES nha_cc(ma_ncc)
);

CREATE TABLE vat_tu (
                        ma_vt INT PRIMARY KEY,
                        ten_vt VARCHAR(255)
);

CREATE TABLE chi_tiet_phieu_xuat (
                                     id INT,
                                     dg_xuat FLOAT,
                                     sl_xuat INT,
                                     so_px INT,
                                     ma_vt INT,
                                     PRIMARY KEY (id, so_px, ma_vt),
                                     FOREIGN KEY (so_px) REFERENCES phieu_xuat(so_px),
                                     FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt)
);

CREATE TABLE chi_tiet_phieu_nhap (
                                     id INT,
                                     dg_nhap FLOAT,
                                     sl_nhap INT,
                                     so_pn INT,
                                     ma_vt INT,
                                     PRIMARY KEY (id, so_pn, ma_vt),
                                     FOREIGN KEY (so_pn) REFERENCES phieu_nhap(so_pn),
                                     FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt)
);

CREATE TABLE chi_tiet_don_dh (
                                 id INT PRIMARY KEY,
                                 ma_vt INT,
                                 so_dh INT,
                                 sl_dh INT,
                                 FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt),
                                 FOREIGN KEY (so_dh) REFERENCES don_dh(so_dh)
);
