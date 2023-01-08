create database penjualan;
\l;
\c penjualan;


-- struktur tabel
create table supplier(
    id_supplier int primary key,
    nama varchar(255),
    age int,
    no_telp int
);
-- CRUD TABEL supplier
-- insert into supplier(id_supplier,nama,age,no_telp) values(1,'zero',19,08123456789);
-- selecy * from supplier;
-- update supplier set nama='zeroUpdate' , age=22, no_telp=0811111111 where id_supplier=1;
-- delete from supplier where id_supplier=1;

-- struktur tabel
create table produk(
    kode_produk varchar(255) primary key,
    nama_produk varchar(255),
    harga int,
    stok int,
    CONSTRAINT fk_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);
-- CRUD TABEL produk
-- insert into produk(kode_produk,nama_produk,harga,stok) values(1,'mie',2000,10);
-- selecy * from produk;
-- update produk set nama_produk='mie sedap', harga=3000, stok=9 where kode_produk=1;
-- delete from produk where kode_produk=1;

-- struktur tabel
create table penjualan(
    id_penjualan varchar(255) primary key,
    tanggal date,
    keterangan varchar(255),
    total int
);
-- CRUD TABEL penjualan
-- insert into penjualan(id_penjualan,tanggal,keterangan,total) values(1,01-01-2023,'mie',3);
-- selecy * from penjualan;
-- update penjualan set keterangan='kopi', total=4 where id_penjualan=1;
-- delete from penjualan where id_penjualan=1;

-- struktur tabel
create table pembayaran(
    id_pembayaran int primary key,
    tanggal_pembayaran DATE,
    total INT
    metode_pembayaran varchar(255),
    CONSTRAINT fk_penjualan FOREIGN key (id_penjualan) REFERENCES penjualan(id_penjualan)
);
-- CRUD TABEL pembayaran
-- insert into pembayaran(id_pembayaran,tanggal_pembayaran,total,metode_pembayaran) values(1,'01-01-2023',10000,cash);
-- selecy * from pembayaran;
-- update pembayaran set tanggal_pembayaran='02-01-2023', total=50000, metode_pembayaran=cash where id_pembayaran=1;
-- delete from pembayaran where id_pembayaran=1;

-- struktur tabel
create table penjualan_detail(
    id_detail_penjualan int primary key,
    kuantitas INT,
    CONSTRAINT fk_penjualan FOREIGN KEY (id_penjualan) REFERENCES penjualan(id_penjualan), 
    CONSTRAINT fk_produk FOREIGN KEY (kode_produk) REFERENCES produk(kode_produk)
);
-- CRUD TABEL penjualan_detail
-- insert into penjualan_detail(id_detail_penjualan,kuantitas) values(1,'50000');
-- selecy * from penjualan_detail;
-- update penjualan_detail set kuantitas='4' where id_detail_penjualan=1;
-- delete from penjualan_detail where id_detail_penjualan=1;