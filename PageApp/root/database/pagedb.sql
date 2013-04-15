--
-- Add users and role tables, along with a many-to-many join table
--
PRAGMA foreign_keys = ON;

CREATE TABLE users (
        id            INTEGER PRIMARY KEY,
        username      TEXT,
        password      TEXT,
        email_address TEXT,
        first_name    TEXT,
        last_name     TEXT,
        active        INTEGER
);
CREATE TABLE roles (
        id   INTEGER PRIMARY KEY,
        role TEXT
);
CREATE TABLE user_roles (
        user_id INTEGER REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (user_id, role_id)
);

--
-- Load up some initial test data
--
INSERT INTO users VALUES (1, 'everett',  'test',  't02@na.com', 'Jane', 'Doe',  1);
INSERT INTO users VALUES (2, 'gottberg', 'test',  't01@na.com', 'Joe',  'Blow', 1);
INSERT INTO users VALUES (3, 'antonio',  'test',  't03@na.com', 'No',   'Go',   0);
INSERT INTO users VALUES (4, 'collard',  'test',  't03@na.com', 'No',   'Go',   0);

INSERT INTO roles VALUES (1, 'everett');
INSERT INTO roles VALUES (2, 'gottberg');
INSERT INTO roles VALUES (3, 'antonio');
INSERT INTO roles VALUES (4, 'collard');

INSERT INTO user_roles VALUES (1, 1); --users id, role id
INSERT INTO user_roles VALUES (2, 2);
INSERT INTO user_roles VALUES (3, 3);
INSERT INTO user_roles VALUES (4, 4);



--
--Note The genome metadata field:
--
CREATE TABLE genomes (
        id                  INTEGER PRIMARY KEY AUTOINCREMENT,
        sanger_lane_id      TEXT UNIQUE,  --e.g. 1234_5#6
        sanger_study_id     INTEGER,
        site                TEXT,
        country_contact     TEXT,
        mta_agreement       TEXT,
        strain_id           TEXT,
        strain_id_sanger    TEXT,
        top_serotype        TEXT,
        top_serotype_perc   REAL,
        second_seotype      TEXT,
        second_seotype_perc REAL,
        mlst                TEXT,
        analysis_status     TEXT,  --included or excluded from analysis?
        analysis_comment    TEXT,  --explains the reasons for the column above
        jusficitation       TEXT,  --justification for sequencing
        gender              TEXT,
        age_in_years        INTEGER,
        age_in_months       INTEGER,
        body_source         TEXT,     --e.g. carriage; blood; CSF; other...
        meningitis_outbreak_isolate TEXT,
        hiv                 TEXT,
        date_of_isolation   TEXT, --(yyyy-mm-dd),
        context             TEXT, --surveillance? Hospital?,
        country_of_origin   TEXT,
        region              TEXT,
        city                TEXT,
        hospital            TEXT,
        latitude            TEXT,
        longitude           TEXT,
        location_country    TEXT,
        location_city       TEXT,
        cd4_count           TEXT,
        age_category        TEXT,
        no                  TEXT,
        lab_no              TEXT,
        country_st          TEXT,
        country             TEXT,
        date_received       TEXT,
        culture_received    TEXT,
        sa_st               NUMBER,
        sa_penz             NUMBER,
        sa_eryz             NUMBER,
        sa_cliz             NUMBER,
        sa_tetz             NUMBER,
        sa_chlz             NUMBER,
        sa_rifz             NUMBER,
        sa_optz             NUMBER,
        sa_penmic           REAL,
        sa_amomic           REAL,
        sa_furmic           REAL,
        sa_cromic           REAL,
        sa_taxmic           REAL,
        sa_mermic           REAL,
        sa_vanmic           REAL,
        sa_erymic           REAL,
        sa_telmic           REAL,
        sa_climic           REAL,
        sa_tetmic           INTEGER,
        sa_cotmic           INTEGER,
        sa_chlmic           INTEGER,
        sa_cipmic           INTEGER,
        sa_levmic           REAL,
        sa_rifmic           INTEGER,
        sa_linmic           INTEGER,
        sa_synmic           INTEGER
);

--
-- Which roles are allowed to see which genomes?
--
CREATE TABLE genome_roles (
        genome_id INTEGER REFERENCES genomes(id) ON DELETE CASCADE ON UPDATE CASCADE,
        role_id role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE ON UPDATE CASCADE,
        PRIMARY KEY (genome_id, role_id)
);


--
-- Save password protected files in this table. See 'insert_pdf.pl' as insertion example.
-- Retrieval example is shown in 'fetchfile' subroutine of the 'Data.pm' model.
--
create table page_files (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE,
    content_type TEXT,
    size_in_bytes INTEGER,
    file_blob BLOB
);
