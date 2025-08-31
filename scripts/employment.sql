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
-- Name: employment; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE employment (
    role_type_id_from character varying(20) NOT NULL,
    role_type_id_to character varying(20) NOT NULL,
    party_id_from character varying(20) NOT NULL,
    party_id_to character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    termination_reason_id character varying(20),
    termination_type_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.employment OWNER TO ofbiz;

--
-- Name: employment pk_employment; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment
    ADD CONSTRAINT pk_employment PRIMARY KEY (role_type_id_from, role_type_id_to, party_id_from, party_id_to, from_date);


--
-- Name: emplmnt_fptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_fptrl ON employment USING btree (party_id_from, role_type_id_from);


--
-- Name: emplmnt_fpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_fpty ON employment USING btree (party_id_from);


--
-- Name: emplmnt_tptrl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_tptrl ON employment USING btree (party_id_to, role_type_id_to);


--
-- Name: emplmnt_tpty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX emplmnt_tpty ON employment USING btree (party_id_to);


--
-- Name: employment_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX employment_txcrts ON employment USING btree (created_tx_stamp);


--
-- Name: employment_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX employment_txstmp ON employment USING btree (last_updated_tx_stamp);


--
-- Name: employment emplmnt_fptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment
    ADD CONSTRAINT emplmnt_fptrl FOREIGN KEY (party_id_from, role_type_id_from) REFERENCES party_role(party_id, role_type_id);


--
-- Name: employment emplmnt_fpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment
    ADD CONSTRAINT emplmnt_fpty FOREIGN KEY (party_id_from) REFERENCES party(party_id);


--
-- Name: employment emplmnt_tptrl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment
    ADD CONSTRAINT emplmnt_tptrl FOREIGN KEY (party_id_to, role_type_id_to) REFERENCES party_role(party_id, role_type_id);


--
-- Name: employment emplmnt_tpty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY employment
    ADD CONSTRAINT emplmnt_tpty FOREIGN KEY (party_id_to) REFERENCES party(party_id);


--
-- PostgreSQL database dump complete
--

