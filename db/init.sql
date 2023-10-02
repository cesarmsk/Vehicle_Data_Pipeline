/* 
dimension tables for events, entities, vehicles, organizations,... 
and their relationships weren't considered for simplicity
*/

CREATE TABLE vehicle_events (
    vehicle_events_id SERIAL PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    entity_on_id VARCHAR(50) NOT NULL,
    event_at_timestamp TIMESTAMP NOT NULL,
    vehicle_id VARCHAR(50) NOT NULL,
    lat DECIMAL(9, 6),
    lng DECIMAL(9, 6),
    location_at_timestamp TIMESTAMP NOT NULL,
    organization_id VARCHAR(50) NOT NULL
);

CREATE TABLE operating_periods (
    operating_periods_id SERIAL PRIMARY KEY,
    vehicle_id VARCHAR(50) NOT NULL,
    start_timestamp TIMESTAMP NOT NULL,
    finish_timestamp TIMESTAMP NOT NULL
);

