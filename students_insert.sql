-- Connect to the students_db database
-- \c students_db; -- This will automatically be done after connection

-- Create the students table
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    program VARCHAR(255) NOT NULL
);

-- Insert student data
INSERT INTO students (name, program) VALUES 
    ('Alfred Felix', 'Software Engineering'),
    ('Allison David', 'Software Engineering'),
    ('Zahra Zain', 'Cybersecurity and Digital Forensics Engineering'),
    ('Peter Linus', 'Cybersecurity and Digital Forensics Engineering'),
    ('Annabeth Chase', 'Computer Science'),
    ('Perseus Jackson', 'Computer Science'),
    ('Harold Styles', 'Computer Science'),
    ('Harold Potter', 'Software Engineering'),
    ('Albus Dumbledore', 'Cybersecurity and Digital Forensics'),
    ('Dolly Parton', 'Computer Science');

-- Verify data insertion
SELECT * FROM students;
