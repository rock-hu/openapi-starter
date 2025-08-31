--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: person; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE person (
    party_id character varying(20) NOT NULL,
    salutation character varying(100),
    first_name character varying(100),
    middle_name character varying(100),
    last_name character varying(100),
    personal_title character varying(100),
    suffix character varying(100),
    nickname character varying(100),
    first_name_local character varying(100),
    middle_name_local character varying(100),
    last_name_local character varying(100),
    other_local character varying(100),
    member_id character varying(20),
    gender character(1),
    birth_date date,
    deceased_date date,
    height double precision,
    weight double precision,
    mothers_maiden_name character varying(255),
    marital_status character(1),
    marital_status_enum_id character varying(20),
    social_security_number character varying(255),
    passport_number character varying(255),
    passport_expire_date date,
    total_years_work_experience double precision,
    comments character varying(255),
    employment_status_enum_id character varying(20),
    residence_status_enum_id character varying(20),
    occupation character varying(100),
    years_with_employer numeric(20,0),
    months_with_employer numeric(20,0),
    existing_customer character(1),
    card_id character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.person OWNER TO ofbiz;

--
-- Name: person pk_person; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person
    ADD CONSTRAINT pk_person PRIMARY KEY (party_id);


--
-- Name: card_id_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX card_id_idx ON person USING btree (card_id);


--
-- Name: first_name_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX first_name_idx ON person USING btree (first_name);


--
-- Name: last_name_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX last_name_idx ON person USING btree (last_name);


--
-- Name: person_emps_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_emps_enum ON person USING btree (employment_status_enum_id);


--
-- Name: person_marital; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_marital ON person USING btree (marital_status_enum_id);


--
-- Name: person_party; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_party ON person USING btree (party_id);


--
-- Name: person_ress_enum; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_ress_enum ON person USING btree (residence_status_enum_id);


--
-- Name: person_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_txcrts ON person USING btree (created_tx_stamp);


--
-- Name: person_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX person_txstmp ON person USING btree (last_updated_tx_stamp);


--
-- Name: person person_emps_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_emps_enum FOREIGN KEY (employment_status_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: person person_marital; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_marital FOREIGN KEY (marital_status_enum_id) REFERENCES enumeration(enum_id);


--
-- Name: person person_party; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_party FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: person person_ress_enum; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_ress_enum FOREIGN KEY (residence_status_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

