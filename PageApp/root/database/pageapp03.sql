create table page_files (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE,
    content_type TEXT,
    size_in_bytes INTEGER,
    file_blob BLOB
);
