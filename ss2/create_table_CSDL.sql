create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh(
    ma_hs varchar(20) primary key,
    ten_hs varchar(50) not null ,
    ngay_sinh datetime,
    lop varchar(20),
    gt varchar(20)
);
create table mon_hoc(
    ma_mh varchar(20) primary key,
    ten_mh varchar(50) not null,
    ma_gv varchar(20)
);
create table bang_diem(
    ma_hs varchar(20),
    ma_mh varchar(50),
    diem_thi int,
    ngay_kt datetime,
    primary key (ma_hs,ma_mh),
    foreign key (ma_hs) references hoc_sinh(ma_hs),
    foreign key (ma_mh) references mon_hoc(ma_mh)
);
create table giao_vien(
    ma_gv varchar(20) primary key ,
    ten_gv varchar(50),
    sdt varchar(10)
);
alter table mon_hoc add constraint FK_MaGV foreign key (ma_gv) references giao_vien(ma_gv);
insert into hoc_sinh value (1,'Nguyên','1997-12-30','c0224','sda');
insert into hoc_sinh value (2,'Quyết','1997-12-30','c0224','sda');
insert into hoc_sinh value (3,'Nam','1997-12-30','c0224','sda');
insert into giao_vien value ('gv1','Nguyên','09833432');
insert into giao_vien value ('gv2','Hoàng','09833432');
insert into giao_vien value ('gv3','Mạnh','09833432');
insert into mon_hoc value ('mh1','lý','gv1');
insert into mon_hoc value ('mh2','hoá','gv2');
insert into mon_hoc value ('mh3','toán','gv3');
insert into bang_diem value ('1','mh1',10,'2024-11-7');
insert into bang_diem value ('2','mh1',10,'2024-11-7');
insert into bang_diem value ('3','mh1',10,'2024-11-7');
insert into bang_diem value ('1','mh2',8,'2024-11-7');
select * from bang_diem where diem_thi = 8;
select * from bang_diem ngu join hoc_sinh hs on ngu.ma_hs = hs.ma_hs;
select * from mon_hoc mh join bang_diem bd on mh.ma_mh = bd.ma_mh;