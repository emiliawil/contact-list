/* Create trigger function */
CREATE OR REPLACE FUNCTION trigger_set_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

/* Create the contacts table */
CREATE TABLE contacts (
  id SERIAL NOT NULL PRIMARY KEY,
  last_name VARCHAR(35),
  first_name VARCHAR(35),
  address_line1 VARCHAR(100),
  address_line2 VARCHAR(100),
  locality VARCHAR(35),
  region VARCHAR(35),
  postcode VARCHAR(20),
  country VARCHAR(35),
  primary_phone VARCHAR(20),
  secondary_phone VARCHAR(20),
  primary_email VARCHAR(50),
  secondary_email VARCHAR(50),
  birthday DATE,
  anniversary DATE,
  cards BOOLEAN DEFAULT FALSE,
  presents BOOLEAN DEFAULT FALSE,
  comment TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

/* Create the trigger */
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON contacts
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_timestamp();

/* Insert some data */
INSERT INTO contacts (last_name, first_name, address_line1, address_line2, locality, region, postcode, country, primary_phone, secondary_phone, primary_email, secondary_email, birthday, anniversary, cards, presents, comment) VALUES
('Smith', 'John', '123 Main Street', '', 'Anytown', 'Anyregion', '12345', 'United States', '555-555-5555', '555-555-5555', 'john@email.com', '', '1980-01-01', '2003-03-10', TRUE, FALSE,'This is a comment'),
('Smith', 'Jane', '123 Main Street', '', 'Anytown', 'Anyregion', '12345', 'United States', '555-555-5555', '', 'jane@email.com', 'secondaryjane@email.com', '1982-06-23', '2003-03-10', TRUE, FALSE,'This is a comment')
RETURNING *;