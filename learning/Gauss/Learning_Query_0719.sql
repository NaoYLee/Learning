-- Active: 1752845857763@@192.168.10.130@5432@gaussdb_learning@public
DO $$
BEGIN
    RAISE NOTICE 'hello world!';
END $$;
CREATE TABLE test_0719 (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    age INTEGER,
    gender INTEGER DEFAULT 1
);
INSERT INTO test_0719
    VALUES
    (1, '张一', 26, 1),
    (2, '王二', 34, 1),
    (3, '李三', 26, 2),
    (4, '赵四', 24, 1);
ALTER TABLE test_0719
MODIFY gender VARCHAR;
UPDATE test_0719
SET gender = '女'
WHERE gender = '2';
SELECT *
FROM test_0719;
