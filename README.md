# Project akhir MDS

Topik `Profile Responden Survey dan Aktivitasnya`

## Kelompok 6

    1.  G1501221024 Tahira Fulazzaky
    2.  G1501221032 Diaztri Hazam
    3.  G1501222046 Setyo Wahyudi
    4.  G1501222059 Intan Juliana Panjaitan

## Role Posisi

    Data Manager      : Setyo Wahyudi
    Shiny Developer
      Front-end       : 1. Setyo Wahyudi
                        2. Tahira Fulazzaky
                        3. Intan Juliana Panjaitan
      Back-end        : 1. Diaztri Hazam
                        2. Tahira Fulazzaky
    Technical Writer  : Intan Juliana Panjaitan

## Deskripsi Data

#### 1. Tabel *yo_user*

Tabel *yo_user* merupakan tabel yang memuat data demografi panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute    | Type                  | Description                     |
|:-------------|:----------------------|:--------------------------------|
| id           | character varying(10) | Id panelis                      |
| uid          | character varying(8)  | Unique id panelis               |
| username     | character varying(30) | Username                        |
| firstname    | character varying(15) | Firstname                       |
| lastname     | character varying(15) | Lastname                        |
| gender       | smallint              | Jenis kelamin                   |
| province_id  | character varying(10) | Asal provinsi                   |
| city_id      | character varying(10) | Asal kota                       |
| birthdate    | timestamp             | Tanggal lahir                   |
| linkshare_id | character varying(10) | Informasi join melalui campaign |

#### 2. Tabel *yo_survey*

Tabel *yo_survey* merupakan tabel yang memuat data survey sederhana (polling) yang dibuat oleh panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute     | Type                   | Description                                                |
|:---------------|:---------------|:---------------------------------------|
| id            | character varying(10)  | ID survey                                                  |
| user_id       | character varying(10)  | ID panelis yang membuat survey                             |
| category_name | character varying(80)  | Kelompok kategori survey                                   |
| qtype         | integer                | Type pertanyaan (Choice, OpenEnd, Bandingan, Like/Dislike) |
| question      | character varying(750) | Pertanyaan pada survey                                     |
| answer        | text                   | Pilihan jawaban                                            |
| point         | integer                | Poin yang akan diberikan jika join survey (if any)         |

#### 3. Tabel *yo_survey_answer*

Tabel *yo_survey_answer* merupakan tabel yang memuat data hasil isian (respon) untuk survey sederhana (polling) yang dibuat oleh panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute    | Type                  | Description                                         |
|:-----------------------|:-----------------------|:-----------------------|
| survey_id    | character varying(10) | ID survey yang diikuti                              |
| user_id      | character varying(10) | ID panelis yang join survey pada survey_id tertentu |
| answer       | text                  | Jawaban panelis                                     |
| created_date | timestamp             | Tanggal menjawab pertanyaan                         |

#### 4. Tabel *yo_survey_new*

Tabel *yo_survey_new* merupakan tabel yang memuat daftar survey yang berbasis project (client), adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute    | Type                   | Description                                      |
|:---------------|:-----------------|:-------------------------------------|
| uid_survey   | character varying(20)  | ID survey project base                           |
| poin         | integer                | Poin yang akan diberikan untuk panelis yang join |
| publish_date | timestamp              | Tanggal mulai survey                             |
| end_date     | timestamp              | Tanggal akhir survey                             |
| created      | timestamp              | Tanggal dibuat survey                            |
| modified     | timestamp              | Tanggal survey dimodifikasi                      |
| nama_survey  | character varying(200) | Nama survey                                      |

#### 5. Tabel *yo_survey_data_user*

Tabel *yo_survey_data_user* merupakan tabel yang memuat daftar panel yang sudah mengikuti/join pada survey yang berbasis project (client), adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute | Type                  | Description                                            |
|:-----------------------|:-----------------------|:-----------------------|
| id        | character varying(10) | id                                                     |
| id_survey | character varying(10) | ID survey project base                                 |
| uid       | character varying(10) | ID panelis yang join survey pada survey_id tertentu    |
| n_status  | integer               | Status pengisian survey (complete,screenout,fullquota) |
| created   | timestamp             | Tanggal join survey                                    |
| modified  | timestamp             | Tanggal survey dimodifikasi                            |

#### 6. Tabel *yo_region_province*

Tabel *yo_region_province* merupakan tabel yang berisikan seluruh daftar provinsi yang ada di Indonesia, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute   | Type                  | Description                                 |
|:-----------------------|:-----------------------|:-----------------------|
| id_province | character varying(10) | ID provinsi yang ada di Indonesia           |
| province    | character varying(45) | Nama provinsi yang ada di seluruh Indonesia |

#### 7. Tabel *yo_region_city*

Tabel *yo_region_city* merupakan tabel yang berisikan seluruh daftar nama kabupaten / kota disetiap provinsi yang ada di Indonesia, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute   | Type                  | Description                             |
|:-----------------------|:-----------------------|:-----------------------|
| city_id     | character varying(10) | ID kota yang ada di Indonesia           |
| city        | character varying(45) | Nama kota yang ada di seluruh Indonesia |
| province_id | character varying(10) | ID provinsi yang ada di Indonesia       |

#### 8. Tabel *yo_linkshare*

Tabel *yo_linkshare* merupakan tabel yang berisikan informasi metode perekrutan panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute     | Type                  | Description                                     |
|:----------------|:-----------------|:-------------------------------------|
| id            | character varying(10) | ID Campaign                                     |
| name          | character varying(50) | Nama Campaign                                   |
| poin          | integer               | Poin yang diperoleh jika join campaign (if any) |
| created_date  | timestamp             | Tanggal Campaign Dibuat                         |
| modified_date | timestamp             | Perubahan Tanggal Campaign                      |

#### 9. Tabel *yo_user_point*

Tabel *yo_user_point* merupakan tabel yang berisikan informasi jumlah point yang dimiliki dari masing-masing panelis, adapun detail atribut dan deskripsi dari masing-masing adalah sebagai berikut:

| Attribute     | Type                  | Description                         |
|:----------------|:--------------------|:---------------------------------|
| user_id       | character varying(10) | ID panelis                          |
| point         | integer               | Poin yang diperoleh hingga saat ini |
| modified_date | timestamp             | Tanggal poin terakhir yang diterima |

## QUERY

### Create Table yo_linkshare

```sql
CREATE TABLE IF NOT EXISTS public.yo_linkshare
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    poin integer,
    created_date timestamp without time zone,
    modified_date timestamp without time zone,
    CONSTRAINT yo_linkshare_pkey PRIMARY KEY (id)
);
```

### Create Table yo_region_city

```sql
CREATE TABLE IF NOT EXISTS public.yo_region_city
(
    city_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    city character varying(45) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    province_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT yo_region_city_pkey PRIMARY KEY (city_id),
    CONSTRAINT yo_region_city_province_id_pasien_fkey FOREIGN KEY (province_id)
        REFERENCES public.yo_region_province (id_province) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

### Create Table yo_region_province

```sql
CREATE TABLE IF NOT EXISTS public.yo_region_province 
(
    id_province character varying(10) COLLATE pg_catalog."default" NOT NULL, 
    province character varying(45) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT yo_region_province_pkey PRIMARY KEY (id_province) 
);
```

### Create Table yo_survey

```sql
CREATE TABLE IF NOT EXISTS public.yo_survey 
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    user_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    category_name character varying(80) COLLATE pg_catalog."default" NOT NULL,
    qtype integer NOT NULL,
    question character varying(750) COLLATE pg_catalog."default" NOT NULL,
    answer text COLLATE pg_catalog."default" NOT NULL,
    point integer DEFAULT 0,
    CONSTRAINT yo_survey_pkey PRIMARY KEY (id), 
    CONSTRAINT yo_survey_id_fkey FOREIGN KEY (user_id) 
        REFERENCES public.yo_user (id) MATCH SIMPLE 
        ON UPDATE NO ACTION
        ON DELETE NO ACTION 
);
```

### Create Table yo_survey_answer

```sql
CREATE TABLE IF NOT EXISTS public.yo_survey_answer
(
    survey_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    user_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    answer text COLLATE pg_catalog."default" NOT NULL,
    created_date timestamp without time zone NOT NULL,
    CONSTRAINT yo_survey_answer_pkey PRIMARY KEY (survey_id, user_id),
    CONSTRAINT yo_survey_answer_survey_id_fkey FOREIGN KEY (survey_id)
        REFERENCES public.yo_survey (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_survey_answer_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.yo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

### Create Table yo_survey_data_user

```sql
CREATE TABLE IF NOT EXISTS public.yo_survey_data_user
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    id_survey character varying(10) COLLATE pg_catalog."default" NOT NULL,
    uid character varying(10) COLLATE pg_catalog."default" NOT NULL,
    n_status integer NOT NULL,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    CONSTRAINT yo_survey_data_user_pkey PRIMARY KEY (id, id_survey, uid),
    CONSTRAINT yo_survey_new_id_survey_fkey FOREIGN KEY (id_survey)
        REFERENCES public.yo_survey_new (uid_survey) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_survey_new_uid_fkey FOREIGN KEY (uid)
        REFERENCES public.yo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

### Create Table yo_survey_new

```sql
CREATE TABLE IF NOT EXISTS public.yo_survey_new
(
    uid_survey character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nama_survey character varying(200) COLLATE pg_catalog."default" NOT NULL,
    poin integer NOT NULL,
    publish_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    CONSTRAINT yo_survey_new_pkey PRIMARY KEY (uid_survey)
);
```

### Create Table yo_survey_new

```sql
CREATE TABLE IF NOT EXISTS public.yo_user
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    uid character varying(8) COLLATE pg_catalog."default" NOT NULL,
    username character varying(30) COLLATE pg_catalog."default" NOT NULL,
    firstname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    gender smallint DEFAULT '0'::smallint,
    province_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    city_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    birthdate timestamp without time zone,
    linkshare_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT '0'::smallint,
    CONSTRAINT yo_user_pkey PRIMARY KEY (id),
    CONSTRAINT yo_user_city_id_fkey FOREIGN KEY (city_id)
        REFERENCES public.yo_region_city (city_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_user_linkshare_id_fkey FOREIGN KEY (linkshare_id)
        REFERENCES public.yo_linkshare (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT yo_user_province_id_fkey FOREIGN KEY (province_id)
        REFERENCES public.yo_region_province (id_province) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

### Create Table yo_user_point

```sql
CREATE TABLE IF NOT EXISTS public.yo_user_point
(
    user_id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    point integer NOT NULL,
    modified_date timestamp without time zone NOT NULL,
    CONSTRAINT yo_user_point_pkey PRIMARY KEY (user_id),
    CONSTRAINT yo_user_point_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.yo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
```

## Skema Diagram

![](Skema%20Diagram%20-%20Full.png)

## Bagan ERD

![](tugas%20rev2.png)
