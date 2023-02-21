## Create Table yo_linkshare

``` sql
CREATE TABLE IF NOT EXISTS public.yo_linkshare
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    slug character varying(50) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    poin integer,
    value character varying(50) COLLATE pg_catalog."default",
    value_en character varying(50) COLLATE pg_catalog."default",
    is_delete smallint DEFAULT 0,
    created_by smallint,
    created_date timestamp without time zone,
    modified_by smallint,
    modified_date timestamp without time zone,
    CONSTRAINT yo_linkshare_pkey PRIMARY KEY (id)
);
```

## Create Table yo_region_city

``` sql
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
));
```

## Create Table yo_region_province

``` sql
CREATE TABLE IF NOT EXISTS public.yo_region_province ( id_province character varying(10) COLLATE pg_catalog."default" NOT NULL, province character varying(45) COLLATE pg_catalog."default" DEFAULT NULL::character varying, country_id integer NOT NULL, CONSTRAINT yo_region_province_pkey PRIMARY KEY (id_province) );
```

## Create Table yo_survey

``` sql
CREATE TABLE IF NOT EXISTS public.yo_survey ( id character varying(10) COLLATE pg_catalog."default" NOT NULL, uid character varying(32) COLLATE pg_catalog."default" NOT NULL, user_id character varying(10) COLLATE pg_catalog."default" NOT NULL, category_id character varying(10) COLLATE pg_catalog."default" NOT NULL, type integer NOT NULL, question character varying(750) COLLATE pg_catalog."default" NOT NULL, question_en character varying(750) COLLATE pg_catalog."default" DEFAULT NULL::character varying, answer text COLLATE pg_catalog."default" NOT NULL, answer_en text COLLATE pg_catalog."default", days smallint DEFAULT '0'::smallint, hours smallint DEFAULT '0'::smallint, is_delete smallint NOT NULL DEFAULT '0'::smallint, delete_by smallint NOT NULL DEFAULT '0'::smallint, end_date timestamp without time zone NOT NULL, publisher integer DEFAULT 0, point integer DEFAULT 0, publish_date timestamp without time zone, created_date timestamp without time zone NOT NULL, modified_date timestamp without time zone NOT NULL, status_id integer, CONSTRAINT yo_survey_pkey PRIMARY KEY (id), CONSTRAINT yo_survey_id_fkey FOREIGN KEY (user_id) REFERENCES public.yo_user (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION );
```

## Create Table yo_survey_answer

``` sql
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

## Create Table yo_survey_data_user

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

## Create Table yo_survey_new

```sql
CREATE TABLE IF NOT EXISTS public.yo_survey_new
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    uid_survey character varying(20) COLLATE pg_catalog."default" NOT NULL,
    nama_survey character varying(200) COLLATE pg_catalog."default" NOT NULL,
    url_survey character varying(250) COLLATE pg_catalog."default" NOT NULL,
    min_age integer NOT NULL,
    max_age integer NOT NULL,
    gender integer NOT NULL,
    kota character varying(200) COLLATE pg_catalog."default" NOT NULL,
    total_panelis integer NOT NULL,
    poin integer NOT NULL,
    publish_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    status_survey integer NOT NULL,
    is_delete integer NOT NULL,
    delete_by integer NOT NULL,
    complete character varying(200) COLLATE pg_catalog."default" NOT NULL,
    fullquota character varying(200) COLLATE pg_catalog."default" NOT NULL,
    screenout character varying(200) COLLATE pg_catalog."default" NOT NULL,
    disqualified character varying(200) COLLATE pg_catalog."default" NOT NULL,
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone NOT NULL,
    CONSTRAINT yo_survey_new_pkey PRIMARY KEY (uid_survey)
);
```

## Create Table yo_survey_new

```sql
CREATE TABLE IF NOT EXISTS public.yo_user
(
    id character varying(10) COLLATE pg_catalog."default" NOT NULL,
    uid character varying(8) COLLATE pg_catalog."default" NOT NULL,
    username character varying(30) COLLATE pg_catalog."default" NOT NULL,
    firstname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    lastname character varying(15) COLLATE pg_catalog."default" NOT NULL,
    email character varying(35) COLLATE pg_catalog."default" NOT NULL,
    phone character varying(20) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    noidentitas character varying(20) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    gender smallint DEFAULT '0'::smallint,
    province_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    city_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT 0,
    agree smallint DEFAULT '0'::smallint,
    login_type character varying(10) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    login_uid character varying(35) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    password character varying(64) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    confirm_email integer DEFAULT 0,
    confirm_email_date timestamp without time zone,
    birthdate timestamp without time zone,
    last_login timestamp without time zone,
    block smallint NOT NULL DEFAULT '0'::smallint,
    reason smallint NOT NULL DEFAULT '0'::smallint,
    created_date timestamp without time zone,
    modified_date timestamp without time zone NOT NULL,
    linkshare_id character varying(10) COLLATE pg_catalog."default" NOT NULL DEFAULT '0'::smallint,
    ip_address character varying(15) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    verify smallint NOT NULL DEFAULT '0'::smallint,
    longlat character varying(100) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    invite_uid character varying(8) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    verified_date timestamp without time zone,
    verified_by integer,
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
## Create Table yo_user_point

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

